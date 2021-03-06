# Locate Qt5

IF(NOT Qt5_QMAKE_EXECUTABLE)
  FIND_PROGRAM(Qt5_QMAKE_EXECUTABLE
    NO_DEFAULT_PATH
    NAMES qmake qmake5 qmake-qt5
    PATH_SUFFIXES bin
    PATHS
      ${INTR_QTDIR}
      $ENV{INTR_QTDIR}
    )
ENDIF()

SET(Qt5_DIR NOTFOUND CACHE PATH "")

IF (Qt5_QMAKE_EXECUTABLE)
  EXECUTE_PROCESS(COMMAND ${Qt5_QMAKE_EXECUTABLE} -query QT_INSTALL_PREFIX OUTPUT_VARIABLE INSTALL_PREFIX)
  STRING(STRIP ${INSTALL_PREFIX} Qt5_DIR)
  SET(Qt5_DIR ${Qt5_DIR}/lib/cmake/Qt5 CACHE PATH "" FORCE)
ENDIF()
