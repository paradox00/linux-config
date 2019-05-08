
set print pretty on
set pagination off
set confirm off

python
import sys
import glob
sys.path.insert(0, sorted(glob.glob('/usr/share/gcc-*/python'), reverse=True)[0])
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(gdb.current_objfile())
end

# vim: set filetype=gdb  ts=4 sw=4 tw=0 et :
