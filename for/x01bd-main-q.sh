#! /bin/bash
KernelBranch="20210413/r/main-for-q"

IncludeFiles "${MainPath}/device/x01bd.sh"
CustomUploader="Y"
UseSpectrum="Y"
IncludeFiles "${MainPath}/misc/kernel.sh" "https://${GIT_SECRET}@github.com/${GIT_USERNAME}/x01bd_kernel"
FolderUp="xobod-q"
# doSFUp=$FolderUp
TypeBuildTag="[Q]"
spectrumFile="xobod-base.rc"

CloneKernel "--depth=1"
CloneCompiledGccEleven
CloneProtonClang
CompileClangKernel && CleanOut
CloneDTCClang
CompileClangKernel && CleanOut
CompileGccKernel && CleanOut
