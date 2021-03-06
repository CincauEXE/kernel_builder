#! /bin/bash
KernelBranch="20210405/qk-l"

IncludeFiles "${MainPath}/device/merlin-q-oss.sh"
CustomUploader="Y"
IncludeFiles "${MainPath}/misc/kernel.sh" "https://${GIT_SECRET}@github.com/${GIT_USERNAME}/lancelot_kernels"
FolderUp="merlin-qk"
doSFUp=$FolderUp
doOsdnUp=$FolderUp
TypeBuildTag="[STABLE]"

CloneKernel
CloneCompiledGccEleven
CloneDTCClang
CompileClangKernel && pullALmk
CompileClangKernel && pullSlmk
CompileClangKernel && CleanOut


# cleanup stuff after done
cd "${MainPath}"
rm -rf *
