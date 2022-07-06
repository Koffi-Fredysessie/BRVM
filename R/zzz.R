# On library attachment, print message to user.
.onAttach <- function(libname, pkgname) {
  msg <- paste0(
    "\n",
    "== Welcome to BRVM ===========================================================================",
    "\nIf you find this package useful, please leave a star: ",
    "\n   https://github.com/Koffi-Fredysessie/BRVM",
    "\n",
    "\nIf you encounter a bug or want to request an enhancement please file an issue at:",
    "\n   https://github.com/Koffi-Fredysessie/BRVM/issues",
    "\n",
    "\nThank you for using BRVM!",
    "\n"
  )

  packageStartupMessage(msg)
}
