# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([NIEM JSON Specification],[0],[wr@gatech.edu],[niem-json-spec],[wr@gatech.edu])
AC_CONFIG_SRCDIR([Makefile.in])

if test "x$prefix" = "xNONE"
then AC_MSG_ERROR([\$prefix is unset. Set with --prefix=\${install root directory}])
fi

dnl WR_check_prog( $command-name )
dnl   e.g., WR_check_prog(bash) will set @bash@
AC_DEFUN([WR_check_prog],[AC_PATH_PROG($1,$1)
  test "x$[]$1" = "x" && AC_MSG_ERROR([$1 not found])])dnl

dnl WR_check_prog_options( $command-short-name, $command-name-options ... )
dnl   e.g., WR_check_prog_options(cat, gcat cat) will set @cat@
AC_DEFUN([WR_check_prog_options],[AC_PATH_PROGS($1,$2)
  test "x$[]$1" = "x" && AC_MSG_ERROR([$1 not found])])dnl

# Checks for programs.
AC_PROG_INSTALL
AC_PROG_MKDIR_P
AC_PROG_SED
# unix stuff
WR_check_prog(aspell)
WR_check_prog(bash)
WR_check_prog_options(cat,gcat cat)
WR_check_prog(fgrep)
WR_check_prog_options(m4,gm4 m4)
WR_check_prog_options(sort,gsort sort)
# webb stuff
WR_check_prog_options(process_doc,process-doc)

AC_CONFIG_FILES([Makefile], [chmod 444 Makefile])
AC_CONFIG_FILES([run], [chmod 555 run])
AC_SUBST([config_files],$ac_config_files)
AC_OUTPUT
