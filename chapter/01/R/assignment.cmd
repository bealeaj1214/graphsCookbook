library('cacheSweave')
setCacheDir('build')
sweaveFile = commandArgs(trailingOnly=T)[1]
Sweave(sweaveFile, driver = cacheSweaveDriver)
