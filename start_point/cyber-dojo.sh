
# ------------------------------------------------------------------------
# cyber-dojo returns text files under /sandbox that are
# created/deleted/changed. In tidy_up you can remove any
# such files you don't want returned to the browser.

trap tidy_up EXIT

function tidy_up()
{
  delete_files TestResult.xml
}

function delete_dirs()
{
  for dirname in "$@"
  do
      rm -rf "${dirname}" 2> /dev/null || true
  done
}

function delete_files()
{
  for filename in "$@"
  do
      rm "${filename}" 2> /dev/null || true
  done
}

# ------------------------------------------------------------------------
readonly NUNIT_PATH=/usr/lib/cli/nunit.framework-2.6.3

vbnc -nologo \
  -t:library \
  -r:${NUNIT_PATH}/nunit.framework.dll \
    -out:RunTests.dll *.vb

if [ $? -eq 0 ]; then
  nunit-console -nologo RunTests.dll
fi
