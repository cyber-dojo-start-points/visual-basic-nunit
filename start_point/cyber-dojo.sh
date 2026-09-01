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

readonly REF=/usr/share/dotnet/packs/Microsoft.NETCore.App.Ref/10.0.3/ref/net10.0

#FALLBACK, SLOWER ~5.4s:
# comment in the next line if compilation fails
#time (ln -s /home/sandbox/dotnet_obj obj && dotnet test --no-restore --nologo ) ; exit

#FAST ~1.2s:
ln -s ~/.nuget/packages/nunit/4.3.2/lib/net8.0/nunit.framework.dll nunit.framework.dll
#in order to use legacy asserts eg: ClassicAssert.AreEqual(42, 42)
# add on top of the .vb file: Imports NUnit.Framework.Legacy
ln -s ~/.nuget/packages/nunit/4.3.2/lib/net8.0/nunit.framework.legacy.dll nunit.framework.legacy.dll

time (dotnet /usr/share/dotnet/sdk/10.0.103/Roslyn/bincore/vbc.dll \
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
