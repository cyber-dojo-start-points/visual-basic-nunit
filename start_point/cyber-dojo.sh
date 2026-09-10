# --------------------------------------------------------------
# Text files under /sandbox are automatically returned...
source ~/cyber_dojo_fs_cleaners.sh

function cyber_dojo_enter()
{
  : # 1. Only return _newly_ generated reports.
  #cyber_dojo_reset_dirs ${...}
}
function cyber_dojo_exit()
{
  : # 2. Remove new text files we don't want returned.
  cyber_dojo_delete_dirs /sandbox/bin
  cyber_dojo_delete_dirs /sandbox/obj
  cyber_dojo_delete_files TestResult.xml
}
cyber_dojo_enter
trap cyber_dojo_exit EXIT SIGTERM

# One reference pack is installed, and its version moves as .NET is updated,
# so it is found rather than written out. It carries its own version, which
# is not the compiler's, so the two are found separately.
readonly REF=$(echo /usr/share/dotnet/packs/Microsoft.NETCore.App.Ref/*/ref/net*)

#FALLBACK, SLOWER ~5.4s:
# comment in the next line if compilation fails
#time (ln -s /home/sandbox/dotnet_obj obj && dotnet test --no-restore --nologo ) ; exit

#FAST ~1.2s:
# NUnit's version moves too, so that half of the path is found as well.
ln -s $(echo ~/.nuget/packages/nunit/*/lib/net8.0/nunit.framework.dll) nunit.framework.dll
#in order to use legacy asserts eg: ClassicAssert.AreEqual(42, 42)
# add on top of the .vb file: Imports NUnit.Framework.Legacy
ln -s $(echo ~/.nuget/packages/nunit/*/lib/net8.0/nunit.framework.legacy.dll) nunit.framework.legacy.dll

# One .NET SDK is installed, and its version moves as .NET is updated, so
# the compiler is found rather than written out.
readonly VBC=$(echo /usr/share/dotnet/sdk/*/Roslyn/bincore/vbc.dll)

time (dotnet ${VBC} \
  -target:library \
  -nologo \
  -nostdlib \
  -nosdkpath \
  -define:_MyType=\"Empty\" \
  -vbruntime:${REF}/Microsoft.VisualBasic.dll \
  -out:dojo.dll \
  -r:nunit.framework.dll \
  -r:nunit.framework.legacy.dll \
  -r:${REF}/System.Runtime.dll \
  -r:${REF}/System.Linq.dll \
  -r:${REF}/System.Collections.dll \
  -r:${REF}/System.Text.RegularExpressions.dll \
  -r:${REF}/System.Console.dll \
  -r:${REF}/netstandard.dll \
  *.vb && /home/sandbox/.dotnet/tools/nunit dojo.dll --noheader --noresult --nocolor )
