#!/bin/csh

#########################################################################################################
#                 Synopsys Environment Setup (Final Optimized Version)                                  #
#  Set up by: AADARSH K A S | NAVEEN A | TAMIZH AMUTHAN | NAVEEN RAJ | SURESH B | SRIGAJALAKSHMI        #
#                                 VLSI BATCH 2023-2027                                                  #
#########################################################################################################

# ---- 1. License Configuration ----
setenv SNPSLMD_LICENSE_FILE 27020@c2s.cdacb.in

# ---- 2. Base Path Validation ----
setenv BASE_PATH /home/vlsi/Synopsys/Synopsys_install
if ( ! -d $BASE_PATH ) then
    echo "ERROR: Base path $BASE_PATH not found."
    exit 1
endif

# ---- 3. Tool Home Definitions ----
setenv CC_HOME        $BASE_PATH/Custom_Compiler/customcompiler/W-2024.09-SP2-7
setenv DC_HOME        $BASE_PATH/Design_compiler/syn/W-2024.09-SP5
setenv VCS_HOME       $BASE_PATH/VCS/vcs/W-2024.09-SP2
setenv VERDI_HOME      $BASE_PATH/home/vlsi/Synopsys/Synopsys_install/Verdi/verdi
setenv FUSION_HOME    $BASE_PATH/Fusion_Compiler/fusioncompiler/W-2024.09-SP2
setenv LC_HOME        $BASE_PATH/Library_Compiler/lc/W-2024.09-SP2
setenv STARRC_HOME     $BASE_PATH/Starrc/starrc/W-2024.09-SP1
setenv HSPICE_HOME     $BASE_PATH/Hspice/hspice/V-2023.12-SP2
setenv ICV_HOME       $BASE_PATH/IC_Validator/icvalidator/W-2024.09-SP2
setenv WAVEVIEW_HOME  $BASE_PATH/Waveview/wv/W-2024.09-SP2
setenv PRIMESIM_HOME  $BASE_PATH/Primesim/primesim/W-2024.09-SP2
setenv PRIMEWAVE_HOME   $BASE_PATH/Primewave/W-2024.09-SP2-7
setenv INSTALL_HOME   $BASE_PATH/Installer/install

# ---- 4. Library & OS Compatibility (Rocky 9) ----
setenv KRB_LIB        $ICV_HOME/lib-u/linux64/gcc
if ( -d $KRB_LIB ) then
    if ( ! $?LD_LIBRARY_PATH ) then
        setenv LD_LIBRARY_PATH "${KRB_LIB}"
    else
        setenv LD_LIBRARY_PATH "${KRB_LIB}:${LD_LIBRARY_PATH}"
    endif
    setenv LD_PRELOAD "${KRB_LIB}/libkrb5.so.3:${KRB_LIB}/libk5crypto.so.3:${KRB_LIB}/libgssapi_krb5.so.2"
endif

# ---- 5. PATH Configuration (Comprehensive) ----
# We include both /bin and /bin/linux64 to ensure the shell finds the binaries directly
set path = ( $CC_HOME/bin \
             $FUSION_HOME/bin \
             $LC_HOME/bin \
             $DC_HOME/bin \
             $VCS_HOME/bin \
             $VERDI_HOME/bin \
             $STARRC_HOME/bin \
             $HSPICE_HOME/hspice/bin \
             $HSPICE_HOME/bin \
             $ICV_HOME/bin \
             $ICV_HOME/bin/linux64 \
             $WAVEVIEW_HOME/bin \
             $PRIMESIM_HOME/bin \
             $INSTALL_HOME \
             $path )

# ---- 6. Architecture & Productivity ----
setenv VCS_TARGET_ARCH linux64
setenv HSPICE_ARCH linux64
alias clean_logs 'rm -f *.lis *.log *.out *.status *.pvk *.vdb *.work *.svf'
alias lcheck     'lmstat -a -c $SNPSLMD_LICENSE_FILE'

# ---- 7. Summary Display ----
echo "---------------------------------------------------------------------------------------------------------"
echo " Synopsys Environment Loaded (Rocky Linux 9)"
echo " Set up by: AADARSH K A S | NAVEEN A | TAMIZH AMUTHAN | NAVEEN RAJ | SURESH B | SRIGAJALAKSHMI "
echo "                               VLSI BATCH 2023-2027 "
echo "---------------------------------------------------------------------------------------------------------"
echo " 1. Custom Compiler   [custom_compiler]  7. StarRC           [StarXtract]"
echo " 2. Design Compiler   [dc_shell]         8. HSPICE           [hspice]"
echo " 3. VCS Simulator     [vcs]              9. IC Validator     [icv]"
echo " 4. Verdi Debugger    [verdi]            10. WaveView        [wv]"
echo " 5. Fusion Compiler   [fc_shell]         11. PrimeSim        [primesim]"
echo " 6. Library Compiler  [lc_shell]         "
echo "---------------------------------------------------------------------------------------------------------"
