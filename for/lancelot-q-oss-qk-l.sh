#! /bin/bash
KernelBranch="20210405/qk-l"

IncludeFiles "${MainPath}/device/lancelot-q-oss.sh"
CustomUploader="Y"
IncludeFiles "${MainPath}/misc/kernel.sh" "https://${GIT_SECRET}@github.com/${GIT_USERNAME}/lancelot_kernels"
FolderUp="lancelot-qk"
doSFUp=$FolderUp
doOsdnUp=$FolderUp
TypeBuildTag="[GCC]"

CloneKernel
CloneCompiledGccEleven
CompileGccKernel && pullALmk
CompileGccKernel && pullSlmk
CompileGccKernel && CleanOut


# cleanup stuff after done
cd "${MainPath}"
rm -rf *