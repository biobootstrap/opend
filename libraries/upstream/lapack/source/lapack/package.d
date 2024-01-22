/++
LAPACK bindings for D.

Authors: Ilya Yaroshenko
+/
module lapack;

public import lapack.lapack;

alias gesv_ = sgesv_; ///
alias gesv_ = dgesv_; ///
alias gesv_ = cgesv_; ///
alias gesv_ = zgesv_; ///
alias gbsv_ = sgbsv_; ///
alias gbsv_ = dgbsv_; ///
alias gbsv_ = cgbsv_; ///
alias gbsv_ = zgbsv_; ///
alias gtsv_ = sgtsv_; ///
alias gtsv_ = dgtsv_; ///
alias gtsv_ = cgtsv_; ///
alias gtsv_ = zgtsv_; ///
alias posv_ = sposv_; ///
alias posv_ = dposv_; ///
alias posv_ = cposv_; ///
alias posv_ = zposv_; ///
alias ppsv_ = sppsv_; ///
alias ppsv_ = dppsv_; ///
alias ppsv_ = cppsv_; ///
alias ppsv_ = zppsv_; ///
alias pbsv_ = spbsv_; ///
alias pbsv_ = dpbsv_; ///
alias pbsv_ = cpbsv_; ///
alias pbsv_ = zpbsv_; ///
alias ptsv_ = sptsv_; ///
alias ptsv_ = dptsv_; ///
alias ptsv_ = cptsv_; ///
alias ptsv_ = zptsv_; ///
alias sysv_ = ssysv_; ///
alias sysv_ = dsysv_; ///
alias sysv_ = csysv_; ///
alias sysv_ = zsysv_; ///
alias sysv_rk_ = ssysv_rk_; ///
alias sysv_rk_ = dsysv_rk_; ///
alias sysv_rk_ = csysv_rk_; ///
alias sysv_rk_ = zsysv_rk_; ///
alias sysv_rook_ = ssysv_rook_; ///
alias sysv_rook_ = dsysv_rook_; ///
alias sysv_rook_ = csysv_rook_; ///
alias sysv_rook_ = zsysv_rook_; ///
alias hesv_ = chesv_; ///
alias hesv_ = zhesv_; ///
alias spsv_ = sspsv_; ///
alias spsv_ = dspsv_; ///
alias spsv_ = cspsv_; ///
alias spsv_ = zspsv_; ///
alias hpsv_ = chpsv_; ///
alias hpsv_ = zhpsv_; ///
alias gels_ = sgels_; ///
alias gels_ = dgels_; ///
alias gels_ = cgels_; ///
alias gels_ = zgels_; ///
alias gelsd_ = sgelsd_; ///
alias gelsd_ = dgelsd_; ///
alias gelsd_ = cgelsd_; ///
alias gelsd_ = zgelsd_; ///
alias gglse_ = sgglse_; ///
alias gglse_ = dgglse_; ///
alias gglse_ = cgglse_; ///
alias gglse_ = zgglse_; ///
alias ggglm_ = sggglm_; ///
alias ggglm_ = dggglm_; ///
alias ggglm_ = cggglm_; ///
alias ggglm_ = zggglm_; ///
alias syev_ = ssyev_; ///
alias syev_ = dsyev_; ///
alias heev_ = cheev_; ///
alias heev_ = zheev_; ///
alias syev_2stage_ = ssyev_2stage_; ///
alias syev_2stage_ = dsyev_2stage_; ///
alias heev_2stage_ = cheev_2stage_; ///
alias heev_2stage_ = zheev_2stage_; ///
alias syevd_ = ssyevd_; ///
alias syevd_ = dsyevd_; ///
alias heevd_ = cheevd_; ///
alias heevd_ = zheevd_; ///
alias syevd_2stage_ = ssyevd_2stage_; ///
alias syevd_2stage_ = dsyevd_2stage_; ///
alias heevd_2stage_ = cheevd_2stage_; ///
alias heevd_2stage_ = zheevd_2stage_; ///
alias spev_ = sspev_; ///
alias spev_ = dspev_; ///
alias hpev_ = chpev_; ///
alias hpev_ = zhpev_; ///
alias spevd_ = sspevd_; ///
alias spevd_ = dspevd_; ///
alias hpevd_ = chpevd_; ///
alias hpevd_ = zhpevd_; ///
alias sbev_ = ssbev_; ///
alias sbev_ = dsbev_; ///
alias hbev_ = chbev_; ///
alias hbev_ = zhbev_; ///
alias sbevd_ = ssbevd_; ///
alias sbevd_ = dsbevd_; ///
alias hbevd_ = chbevd_; ///
alias hbevd_ = zhbevd_; ///
alias stev_ = sstev_; ///
alias stev_ = dstev_; ///
alias stevd_ = sstevd_; ///
alias stevd_ = dstevd_; ///
alias gees_ = sgees_; ///
alias gees_ = dgees_; ///
alias gees_ = cgees_; ///
alias gees_ = zgees_; ///
alias geev_ = sgeev_; ///
alias geev_ = dgeev_; ///
alias geev_ = cgeev_; ///
alias geev_ = zgeev_; ///
alias gesvd_ = sgesvd_; ///
alias gesvd_ = dgesvd_; ///
alias gesvd_ = cgesvd_; ///
alias gesvd_ = zgesvd_; ///
alias gesdd_ = sgesdd_; ///
alias gesdd_ = dgesdd_; ///
alias gesdd_ = cgesdd_; ///
alias gesdd_ = zgesdd_; ///
alias sygv_ = ssygv_; ///
alias sygv_ = dsygv_; ///
alias hegv_ = chegv_; ///
alias hegv_ = zhegv_; ///
alias sygvd_ = ssygvd_; ///
alias sygvd_ = dsygvd_; ///
alias hegvd_ = chegvd_; ///
alias hegvd_ = zhegvd_; ///
alias spgv_ = sspgv_; ///
alias spgv_ = dspgv_; ///
alias hpgv_ = chpgv_; ///
alias hpgv_ = zhpgv_; ///
alias spgvd_ = sspgvd_; ///
alias spgvd_ = dspgvd_; ///
alias hpgvd_ = chpgvd_; ///
alias hpgvd_ = zhpgvd_; ///
alias sbgv_ = ssbgv_; ///
alias sbgv_ = dsbgv_; ///
alias hbgv_ = chbgv_; ///
alias hbgv_ = zhbgv_; ///
alias sbgvd_ = ssbgvd_; ///
alias sbgvd_ = dsbgvd_; ///
alias hbgvd_ = chbgvd_; ///
alias hbgvd_ = zhbgvd_; ///
alias gegs_ = sgegs_; ///
alias gegs_ = dgegs_; ///
alias gegs_ = cgegs_; ///
alias gegs_ = zgegs_; ///
alias gges_ = sgges_; ///
alias gges_ = dgges_; ///
alias gges_ = cgges_; ///
alias gges_ = zgges_; ///
alias gegv_ = sgegv_; ///
alias gegv_ = dgegv_; ///
alias gegv_ = cgegv_; ///
alias gegv_ = zgegv_; ///
alias ggev_ = sggev_; ///
alias ggev_ = dggev_; ///
alias ggev_ = cggev_; ///
alias ggev_ = zggev_; ///
alias ggsvd_ = sggsvd_; ///
alias ggsvd_ = dggsvd_; ///
alias ggsvd_ = cggsvd_; ///
alias ggsvd_ = zggsvd_; ///
alias gesvx_ = sgesvx_; ///
alias gesvx_ = dgesvx_; ///
alias gesvx_ = cgesvx_; ///
alias gesvx_ = zgesvx_; ///
alias gbsvx_ = sgbsvx_; ///
alias gbsvx_ = dgbsvx_; ///
alias gbsvx_ = cgbsvx_; ///
alias gbsvx_ = zgbsvx_; ///
alias gtsvx_ = sgtsvx_; ///
alias gtsvx_ = dgtsvx_; ///
alias gtsvx_ = cgtsvx_; ///
alias gtsvx_ = zgtsvx_; ///
alias posvx_ = sposvx_; ///
alias posvx_ = dposvx_; ///
alias posvx_ = cposvx_; ///
alias posvx_ = zposvx_; ///
alias ppsvx_ = sppsvx_; ///
alias ppsvx_ = dppsvx_; ///
alias ppsvx_ = cppsvx_; ///
alias ppsvx_ = zppsvx_; ///
alias pbsvx_ = spbsvx_; ///
alias pbsvx_ = dpbsvx_; ///
alias pbsvx_ = cpbsvx_; ///
alias pbsvx_ = zpbsvx_; ///
alias ptsvx_ = sptsvx_; ///
alias ptsvx_ = dptsvx_; ///
alias ptsvx_ = cptsvx_; ///
alias ptsvx_ = zptsvx_; ///
alias sysvx_ = ssysvx_; ///
alias sysvx_ = dsysvx_; ///
alias sysvx_ = csysvx_; ///
alias sysvx_ = zsysvx_; ///
alias hesvx_ = chesvx_; ///
alias hesvx_ = zhesvx_; ///
alias spsvx_ = sspsvx_; ///
alias spsvx_ = dspsvx_; ///
alias spsvx_ = cspsvx_; ///
alias spsvx_ = zspsvx_; ///
alias hpsvx_ = chpsvx_; ///
alias hpsvx_ = zhpsvx_; ///
alias gelsx_ = sgelsx_; ///
alias gelsx_ = dgelsx_; ///
alias gelsx_ = cgelsx_; ///
alias gelsx_ = zgelsx_; ///
alias gelsy_ = sgelsy_; ///
alias gelsy_ = dgelsy_; ///
alias gelsy_ = cgelsy_; ///
alias gelsy_ = zgelsy_; ///
alias gelss_ = sgelss_; ///
alias gelss_ = dgelss_; ///
alias gelss_ = cgelss_; ///
alias gelss_ = zgelss_; ///
alias syevx_ = ssyevx_; ///
alias syevx_ = dsyevx_; ///
alias heevx_ = cheevx_; ///
alias heevx_ = zheevx_; ///
alias syevr_ = ssyevr_; ///
alias syevr_ = dsyevr_; ///
alias heevr_ = cheevr_; ///
alias heevr_ = zheevr_; ///
alias sygvx_ = ssygvx_; ///
alias sygvx_ = dsygvx_; ///
alias hegvx_ = chegvx_; ///
alias hegvx_ = zhegvx_; ///
alias spevx_ = sspevx_; ///
alias spevx_ = dspevx_; ///
alias hpevx_ = chpevx_; ///
alias hpevx_ = zhpevx_; ///
alias spgvx_ = sspgvx_; ///
alias spgvx_ = dspgvx_; ///
alias hpgvx_ = chpgvx_; ///
alias hpgvx_ = zhpgvx_; ///
alias sbevx_ = ssbevx_; ///
alias sbevx_ = dsbevx_; ///
alias hbevx_ = chbevx_; ///
alias hbevx_ = zhbevx_; ///
alias sbgvx_ = ssbgvx_; ///
alias sbgvx_ = dsbgvx_; ///
alias hbgvx_ = chbgvx_; ///
alias hbgvx_ = zhbgvx_; ///
alias stevx_ = sstevx_; ///
alias stevx_ = dstevx_; ///
alias stevr_ = sstevr_; ///
alias stevr_ = dstevr_; ///
alias geesx_ = sgeesx_; ///
alias geesx_ = dgeesx_; ///
alias geesx_ = cgeesx_; ///
alias geesx_ = zgeesx_; ///
alias ggesx_ = sggesx_; ///
alias ggesx_ = dggesx_; ///
alias ggesx_ = cggesx_; ///
alias ggesx_ = zggesx_; ///
alias geevx_ = sgeevx_; ///
alias geevx_ = dgeevx_; ///
alias geevx_ = cgeevx_; ///
alias geevx_ = zgeevx_; ///
alias ggevx_ = sggevx_; ///
alias ggevx_ = dggevx_; ///
alias ggevx_ = cggevx_; ///
alias ggevx_ = zggevx_; ///
alias bdsdc_ = sbdsdc_; ///
alias bdsdc_ = dbdsdc_; ///
alias bdsqr_ = sbdsqr_; ///
alias bdsqr_ = dbdsqr_; ///
alias bdsqr_ = cbdsqr_; ///
alias bdsqr_ = zbdsqr_; ///
alias disna_ = sdisna_; ///
alias disna_ = ddisna_; ///
alias gbbrd_ = sgbbrd_; ///
alias gbbrd_ = dgbbrd_; ///
alias gbbrd_ = cgbbrd_; ///
alias gbbrd_ = zgbbrd_; ///
alias gbcon_ = sgbcon_; ///
alias gbcon_ = dgbcon_; ///
alias gbcon_ = cgbcon_; ///
alias gbcon_ = zgbcon_; ///
alias gbequ_ = sgbequ_; ///
alias gbequ_ = dgbequ_; ///
alias gbequ_ = cgbequ_; ///
alias gbequ_ = zgbequ_; ///
alias gbrfs_ = sgbrfs_; ///
alias gbrfs_ = dgbrfs_; ///
alias gbrfs_ = cgbrfs_; ///
alias gbrfs_ = zgbrfs_; ///
alias gbtrf_ = sgbtrf_; ///
alias gbtrf_ = dgbtrf_; ///
alias gbtrf_ = cgbtrf_; ///
alias gbtrf_ = zgbtrf_; ///
alias gbtrs_ = sgbtrs_; ///
alias gbtrs_ = dgbtrs_; ///
alias gbtrs_ = cgbtrs_; ///
alias gbtrs_ = zgbtrs_; ///
alias gebak_ = sgebak_; ///
alias gebak_ = dgebak_; ///
alias gebak_ = cgebak_; ///
alias gebak_ = zgebak_; ///
alias gebal_ = sgebal_; ///
alias gebal_ = dgebal_; ///
alias gebal_ = cgebal_; ///
alias gebal_ = zgebal_; ///
alias gebrd_ = sgebrd_; ///
alias gebrd_ = dgebrd_; ///
alias gebrd_ = cgebrd_; ///
alias gebrd_ = zgebrd_; ///
alias gecon_ = sgecon_; ///
alias gecon_ = dgecon_; ///
alias gecon_ = cgecon_; ///
alias gecon_ = zgecon_; ///
alias geequ_ = sgeequ_; ///
alias geequ_ = dgeequ_; ///
alias geequ_ = cgeequ_; ///
alias geequ_ = zgeequ_; ///
alias gehrd_ = sgehrd_; ///
alias gehrd_ = dgehrd_; ///
alias gehrd_ = cgehrd_; ///
alias gehrd_ = zgehrd_; ///
alias gelqf_ = sgelqf_; ///
alias gelqf_ = dgelqf_; ///
alias gelqf_ = cgelqf_; ///
alias gelqf_ = zgelqf_; ///
alias geqlf_ = sgeqlf_; ///
alias geqlf_ = dgeqlf_; ///
alias geqlf_ = cgeqlf_; ///
alias geqlf_ = zgeqlf_; ///
alias geqp3_ = sgeqp3_; ///
alias geqp3_ = dgeqp3_; ///
alias geqp3_ = cgeqp3_; ///
alias geqp3_ = zgeqp3_; ///
alias geqpf_ = sgeqpf_; ///
alias geqpf_ = dgeqpf_; ///
alias geqpf_ = cgeqpf_; ///
alias geqpf_ = zgeqpf_; ///
alias geqrf_ = sgeqrf_; ///
alias geqrf_ = dgeqrf_; ///
alias geqrf_ = cgeqrf_; ///
alias geqrf_ = zgeqrf_; ///
alias gerfs_ = sgerfs_; ///
alias gerfs_ = dgerfs_; ///
alias gerfs_ = cgerfs_; ///
alias gerfs_ = zgerfs_; ///
alias gerqf_ = sgerqf_; ///
alias gerqf_ = dgerqf_; ///
alias gerqf_ = cgerqf_; ///
alias gerqf_ = zgerqf_; ///
alias getrf_ = sgetrf_; ///
alias getrf_ = dgetrf_; ///
alias getrf_ = cgetrf_; ///
alias getrf_ = zgetrf_; ///
alias getri_ = sgetri_; ///
alias getri_ = dgetri_; ///
alias getri_ = cgetri_; ///
alias getri_ = zgetri_; ///
alias getrs_ = sgetrs_; ///
alias getrs_ = dgetrs_; ///
alias getrs_ = cgetrs_; ///
alias getrs_ = zgetrs_; ///
alias ggbak_ = sggbak_; ///
alias ggbak_ = dggbak_; ///
alias ggbak_ = cggbak_; ///
alias ggbak_ = zggbak_; ///
alias ggbal_ = sggbal_; ///
alias ggbal_ = dggbal_; ///
alias ggbal_ = cggbal_; ///
alias ggbal_ = zggbal_; ///
alias gghrd_ = sgghrd_; ///
alias gghrd_ = dgghrd_; ///
alias gghrd_ = cgghrd_; ///
alias gghrd_ = zgghrd_; ///
alias ggqrf_ = sggqrf_; ///
alias ggqrf_ = dggqrf_; ///
alias ggqrf_ = cggqrf_; ///
alias ggqrf_ = zggqrf_; ///
alias ggrqf_ = sggrqf_; ///
alias ggrqf_ = dggrqf_; ///
alias ggrqf_ = cggrqf_; ///
alias ggrqf_ = zggrqf_; ///
alias ggsvp_ = sggsvp_; ///
alias ggsvp_ = dggsvp_; ///
alias ggsvp_ = cggsvp_; ///
alias ggsvp_ = zggsvp_; ///
alias gtcon_ = sgtcon_; ///
alias gtcon_ = dgtcon_; ///
alias gtcon_ = cgtcon_; ///
alias gtcon_ = zgtcon_; ///
alias gtrfs_ = sgtrfs_; ///
alias gtrfs_ = dgtrfs_; ///
alias gtrfs_ = cgtrfs_; ///
alias gtrfs_ = zgtrfs_; ///
alias gttrf_ = sgttrf_; ///
alias gttrf_ = dgttrf_; ///
alias gttrf_ = cgttrf_; ///
alias gttrf_ = zgttrf_; ///
alias gttrs_ = sgttrs_; ///
alias gttrs_ = dgttrs_; ///
alias gttrs_ = cgttrs_; ///
alias gttrs_ = zgttrs_; ///
alias hgeqz_ = shgeqz_; ///
alias hgeqz_ = dhgeqz_; ///
alias hgeqz_ = chgeqz_; ///
alias hgeqz_ = zhgeqz_; ///
alias hsein_ = shsein_; ///
alias hsein_ = dhsein_; ///
alias hsein_ = chsein_; ///
alias hsein_ = zhsein_; ///
alias hseqr_ = shseqr_; ///
alias hseqr_ = dhseqr_; ///
alias hseqr_ = chseqr_; ///
alias hseqr_ = zhseqr_; ///
alias opgtr_ = sopgtr_; ///
alias opgtr_ = dopgtr_; ///
alias upgtr_ = cupgtr_; ///
alias upgtr_ = zupgtr_; ///
alias opmtr_ = sopmtr_; ///
alias opmtr_ = dopmtr_; ///
alias orgbr_ = sorgbr_; ///
alias orgbr_ = dorgbr_; ///
alias ungbr_ = cungbr_; ///
alias ungbr_ = zungbr_; ///
alias orghr_ = sorghr_; ///
alias orghr_ = dorghr_; ///
alias unghr_ = cunghr_; ///
alias unghr_ = zunghr_; ///
alias orglq_ = sorglq_; ///
alias orglq_ = dorglq_; ///
alias unglq_ = cunglq_; ///
alias unglq_ = zunglq_; ///
alias orgql_ = sorgql_; ///
alias orgql_ = dorgql_; ///
alias ungql_ = cungql_; ///
alias ungql_ = zungql_; ///
alias orgqr_ = sorgqr_; ///
alias orgqr_ = dorgqr_; ///
alias ungqr_ = cungqr_; ///
alias ungqr_ = zungqr_; ///
alias orgrq_ = sorgrq_; ///
alias orgrq_ = dorgrq_; ///
alias ungrq_ = cungrq_; ///
alias ungrq_ = zungrq_; ///
alias orgtr_ = sorgtr_; ///
alias orgtr_ = dorgtr_; ///
alias ungtr_ = cungtr_; ///
alias ungtr_ = zungtr_; ///
alias ormbr_ = sormbr_; ///
alias ormbr_ = dormbr_; ///
alias unmbr_ = cunmbr_; ///
alias unmbr_ = zunmbr_; ///
alias ormhr_ = sormhr_; ///
alias ormhr_ = dormhr_; ///
alias unmhr_ = cunmhr_; ///
alias unmhr_ = zunmhr_; ///
alias ormlq_ = sormlq_; ///
alias ormlq_ = dormlq_; ///
alias unmlq_ = cunmlq_; ///
alias unmlq_ = zunmlq_; ///
alias ormql_ = sormql_; ///
alias ormql_ = dormql_; ///
alias unmql_ = cunmql_; ///
alias unmql_ = zunmql_; ///
alias ormqr_ = sormqr_; ///
alias ormqr_ = dormqr_; ///
alias unmqr_ = cunmqr_; ///
alias unmqr_ = zunmqr_; ///
alias ormr3_ = sormr3_; ///
alias ormr3_ = dormr3_; ///
alias unmr3_ = cunmr3_; ///
alias unmr3_ = zunmr3_; ///
alias ormrq_ = sormrq_; ///
alias ormrq_ = dormrq_; ///
alias unmrq_ = cunmrq_; ///
alias unmrq_ = zunmrq_; ///
alias ormrz_ = sormrz_; ///
alias ormrz_ = dormrz_; ///
alias unmrz_ = cunmrz_; ///
alias unmrz_ = zunmrz_; ///
alias ormtr_ = sormtr_; ///
alias ormtr_ = dormtr_; ///
alias unmtr_ = cunmtr_; ///
alias unmtr_ = zunmtr_; ///
alias pbcon_ = spbcon_; ///
alias pbcon_ = dpbcon_; ///
alias pbcon_ = cpbcon_; ///
alias pbcon_ = zpbcon_; ///
alias pbequ_ = spbequ_; ///
alias pbequ_ = dpbequ_; ///
alias pbequ_ = cpbequ_; ///
alias pbequ_ = zpbequ_; ///
alias pbrfs_ = spbrfs_; ///
alias pbrfs_ = dpbrfs_; ///
alias pbrfs_ = cpbrfs_; ///
alias pbrfs_ = zpbrfs_; ///
alias pbstf_ = spbstf_; ///
alias pbstf_ = dpbstf_; ///
alias pbstf_ = cpbstf_; ///
alias pbstf_ = zpbstf_; ///
alias pbtrf_ = spbtrf_; ///
alias pbtrf_ = dpbtrf_; ///
alias pbtrf_ = cpbtrf_; ///
alias pbtrf_ = zpbtrf_; ///
alias pbtrs_ = spbtrs_; ///
alias pbtrs_ = dpbtrs_; ///
alias pbtrs_ = cpbtrs_; ///
alias pbtrs_ = zpbtrs_; ///
alias pocon_ = spocon_; ///
alias pocon_ = dpocon_; ///
alias pocon_ = cpocon_; ///
alias pocon_ = zpocon_; ///
alias poequ_ = spoequ_; ///
alias poequ_ = dpoequ_; ///
alias poequ_ = cpoequ_; ///
alias poequ_ = zpoequ_; ///
alias porfs_ = sporfs_; ///
alias porfs_ = dporfs_; ///
alias porfs_ = cporfs_; ///
alias porfs_ = zporfs_; ///
alias potrf_ = spotrf_; ///
alias potrf_ = dpotrf_; ///
alias potrf_ = cpotrf_; ///
alias potrf_ = zpotrf_; ///
alias potri_ = spotri_; ///
alias potri_ = dpotri_; ///
alias potri_ = cpotri_; ///
alias potri_ = zpotri_; ///
alias potrs_ = spotrs_; ///
alias potrs_ = dpotrs_; ///
alias potrs_ = cpotrs_; ///
alias potrs_ = zpotrs_; ///
alias ppcon_ = sppcon_; ///
alias ppcon_ = dppcon_; ///
alias ppcon_ = cppcon_; ///
alias ppcon_ = zppcon_; ///
alias ppequ_ = sppequ_; ///
alias ppequ_ = dppequ_; ///
alias ppequ_ = cppequ_; ///
alias ppequ_ = zppequ_; ///
alias pprfs_ = spprfs_; ///
alias pprfs_ = dpprfs_; ///
alias pprfs_ = cpprfs_; ///
alias pprfs_ = zpprfs_; ///
alias pptrf_ = spptrf_; ///
alias pptrf_ = dpptrf_; ///
alias pptrf_ = cpptrf_; ///
alias pptrf_ = zpptrf_; ///
alias pptri_ = spptri_; ///
alias pptri_ = dpptri_; ///
alias pptri_ = cpptri_; ///
alias pptri_ = zpptri_; ///
alias pptrs_ = spptrs_; ///
alias pptrs_ = dpptrs_; ///
alias pptrs_ = cpptrs_; ///
alias pptrs_ = zpptrs_; ///
alias ptcon_ = sptcon_; ///
alias ptcon_ = dptcon_; ///
alias ptcon_ = cptcon_; ///
alias ptcon_ = zptcon_; ///
alias pteqr_ = spteqr_; ///
alias pteqr_ = dpteqr_; ///
alias pteqr_ = cpteqr_; ///
alias pteqr_ = zpteqr_; ///
alias ptrfs_ = sptrfs_; ///
alias ptrfs_ = dptrfs_; ///
alias ptrfs_ = cptrfs_; ///
alias ptrfs_ = zptrfs_; ///
alias pttrf_ = spttrf_; ///
alias pttrf_ = dpttrf_; ///
alias pttrf_ = cpttrf_; ///
alias pttrf_ = zpttrf_; ///
alias pttrs_ = spttrs_; ///
alias pttrs_ = dpttrs_; ///
alias pttrs_ = cpttrs_; ///
alias pttrs_ = zpttrs_; ///
alias sbgst_ = ssbgst_; ///
alias sbgst_ = dsbgst_; ///
alias hbgst_ = chbgst_; ///
alias hbgst_ = zhbgst_; ///
alias sbtrd_ = ssbtrd_; ///
alias sbtrd_ = dsbtrd_; ///
alias hbtrd_ = chbtrd_; ///
alias hbtrd_ = zhbtrd_; ///
alias spcon_ = sspcon_; ///
alias spcon_ = dspcon_; ///
alias spcon_ = cspcon_; ///
alias spcon_ = zspcon_; ///
alias hpcon_ = chpcon_; ///
alias hpcon_ = zhpcon_; ///
alias spgst_ = sspgst_; ///
alias spgst_ = dspgst_; ///
alias hpgst_ = chpgst_; ///
alias hpgst_ = zhpgst_; ///
alias sprfs_ = ssprfs_; ///
alias sprfs_ = dsprfs_; ///
alias sprfs_ = csprfs_; ///
alias sprfs_ = zsprfs_; ///
alias hprfs_ = chprfs_; ///
alias hprfs_ = zhprfs_; ///
alias sptrd_ = ssptrd_; ///
alias sptrd_ = dsptrd_; ///
alias hptrd_ = chptrd_; ///
alias hptrd_ = zhptrd_; ///
alias sptrf_ = ssptrf_; ///
alias sptrf_ = dsptrf_; ///
alias sptrf_ = csptrf_; ///
alias sptrf_ = zsptrf_; ///
alias hptrf_ = chptrf_; ///
alias hptrf_ = zhptrf_; ///
alias sptri_ = ssptri_; ///
alias sptri_ = dsptri_; ///
alias sptri_ = csptri_; ///
alias sptri_ = zsptri_; ///
alias hptri_ = chptri_; ///
alias hptri_ = zhptri_; ///
alias sptrs_ = ssptrs_; ///
alias sptrs_ = dsptrs_; ///
alias sptrs_ = csptrs_; ///
alias sptrs_ = zsptrs_; ///
alias hptrs_ = chptrs_; ///
alias hptrs_ = zhptrs_; ///
alias stebz_ = sstebz_; ///
alias stebz_ = dstebz_; ///
alias stedc_ = sstedc_; ///
alias stedc_ = dstedc_; ///
alias stedc_ = cstedc_; ///
alias stedc_ = zstedc_; ///
alias stegr_ = sstegr_; ///
alias stegr_ = dstegr_; ///
alias stegr_ = cstegr_; ///
alias stegr_ = zstegr_; ///
alias stein_ = sstein_; ///
alias stein_ = dstein_; ///
alias stein_ = cstein_; ///
alias stein_ = zstein_; ///
alias steqr_ = ssteqr_; ///
alias steqr_ = dsteqr_; ///
alias steqr_ = csteqr_; ///
alias steqr_ = zsteqr_; ///
alias sterf_ = ssterf_; ///
alias sterf_ = dsterf_; ///
alias sycon_ = ssycon_; ///
alias sycon_ = dsycon_; ///
alias sycon_ = csycon_; ///
alias sycon_ = zsycon_; ///
alias hecon_ = checon_; ///
alias hecon_ = zhecon_; ///
alias sygst_ = ssygst_; ///
alias sygst_ = dsygst_; ///
alias hegst_ = chegst_; ///
alias hegst_ = zhegst_; ///
alias syrfs_ = ssyrfs_; ///
alias syrfs_ = dsyrfs_; ///
alias syrfs_ = csyrfs_; ///
alias syrfs_ = zsyrfs_; ///
alias herfs_ = cherfs_; ///
alias herfs_ = zherfs_; ///
alias sytrd_ = ssytrd_; ///
alias sytrd_ = dsytrd_; ///
alias hetrd_ = chetrd_; ///
alias hetrd_ = zhetrd_; ///
alias sytrf_ = ssytrf_; ///
alias sytrf_ = dsytrf_; ///
alias sytrf_ = csytrf_; ///
alias sytrf_ = zsytrf_; ///
alias sytrf_rk_ = ssytrf_rk_; ///
alias sytrf_rk_ = dsytrf_rk_; ///
alias sytrf_rk_ = csytrf_rk_; ///
alias sytrf_rk_ = zsytrf_rk_; ///
alias hetrf_ = chetrf_; ///
alias hetrf_ = zhetrf_; ///
alias sytri_ = ssytri_; ///
alias sytri_ = dsytri_; ///
alias sytri_ = csytri_; ///
alias sytri_ = zsytri_; ///
alias hetri_ = chetri_; ///
alias hetri_ = zhetri_; ///
alias sytrs_ = ssytrs_; ///
alias sytrs_ = dsytrs_; ///
alias sytrs_ = csytrs_; ///
alias sytrs_ = zsytrs_; ///
alias sytrs_3_ = ssytrs_3_; ///
alias sytrs_3_ = dsytrs_3_; ///
alias sytrs_3_ = csytrs_3_; ///
alias sytrs_3_ = zsytrs_3_; ///
alias hetrs_ = chetrs_; ///
alias hetrs_ = zhetrs_; ///
alias tbcon_ = stbcon_; ///
alias tbcon_ = dtbcon_; ///
alias tbcon_ = ctbcon_; ///
alias tbcon_ = ztbcon_; ///
alias tbrfs_ = stbrfs_; ///
alias tbrfs_ = dtbrfs_; ///
alias tbrfs_ = ctbrfs_; ///
alias tbrfs_ = ztbrfs_; ///
alias tbtrs_ = stbtrs_; ///
alias tbtrs_ = dtbtrs_; ///
alias tbtrs_ = ctbtrs_; ///
alias tbtrs_ = ztbtrs_; ///
alias tgevc_ = stgevc_; ///
alias tgevc_ = dtgevc_; ///
alias tgevc_ = ctgevc_; ///
alias tgevc_ = ztgevc_; ///
alias tgexc_ = stgexc_; ///
alias tgexc_ = dtgexc_; ///
alias tgexc_ = ctgexc_; ///
alias tgexc_ = ztgexc_; ///
alias tgsen_ = stgsen_; ///
alias tgsen_ = dtgsen_; ///
alias tgsen_ = ctgsen_; ///
alias tgsen_ = ztgsen_; ///
alias tgsja_ = stgsja_; ///
alias tgsja_ = dtgsja_; ///
alias tgsja_ = ctgsja_; ///
alias tgsja_ = ztgsja_; ///
alias tgsna_ = stgsna_; ///
alias tgsna_ = dtgsna_; ///
alias tgsna_ = ctgsna_; ///
alias tgsna_ = ztgsna_; ///
alias tgsyl_ = stgsyl_; ///
alias tgsyl_ = dtgsyl_; ///
alias tgsyl_ = ctgsyl_; ///
alias tgsyl_ = ztgsyl_; ///
alias tpcon_ = stpcon_; ///
alias tpcon_ = dtpcon_; ///
alias tpcon_ = ctpcon_; ///
alias tpcon_ = ztpcon_; ///
alias tprfs_ = stprfs_; ///
alias tprfs_ = dtprfs_; ///
alias tprfs_ = ctprfs_; ///
alias tprfs_ = ztprfs_; ///
alias tptri_ = stptri_; ///
alias tptri_ = dtptri_; ///
alias tptri_ = ctptri_; ///
alias tptri_ = ztptri_; ///
alias tptrs_ = stptrs_; ///
alias tptrs_ = dtptrs_; ///
alias tptrs_ = ctptrs_; ///
alias tptrs_ = ztptrs_; ///
alias trcon_ = strcon_; ///
alias trcon_ = dtrcon_; ///
alias trcon_ = ctrcon_; ///
alias trcon_ = ztrcon_; ///
alias trevc_ = strevc_; ///
alias trevc_ = dtrevc_; ///
alias trevc_ = ctrevc_; ///
alias trevc_ = ztrevc_; ///
alias trexc_ = strexc_; ///
alias trexc_ = dtrexc_; ///
alias trexc_ = ctrexc_; ///
alias trexc_ = ztrexc_; ///
alias trrfs_ = strrfs_; ///
alias trrfs_ = dtrrfs_; ///
alias trrfs_ = ctrrfs_; ///
alias trrfs_ = ztrrfs_; ///
alias trsen_ = strsen_; ///
alias trsen_ = dtrsen_; ///
alias trsen_ = ctrsen_; ///
alias trsen_ = ztrsen_; ///
alias trsna_ = strsna_; ///
alias trsna_ = dtrsna_; ///
alias trsna_ = ctrsna_; ///
alias trsna_ = ztrsna_; ///
alias trsyl_ = strsyl_; ///
alias trsyl_ = dtrsyl_; ///
alias trsyl_ = ctrsyl_; ///
alias trsyl_ = ztrsyl_; ///
alias trtri_ = strtri_; ///
alias trtri_ = dtrtri_; ///
alias trtri_ = ctrtri_; ///
alias trtri_ = ztrtri_; ///
alias trtrs_ = strtrs_; ///
alias trtrs_ = dtrtrs_; ///
alias trtrs_ = ctrtrs_; ///
alias trtrs_ = ztrtrs_; ///
alias tzrqf_ = stzrqf_; ///
alias tzrqf_ = dtzrqf_; ///
alias tzrqf_ = ctzrqf_; ///
alias tzrqf_ = ztzrqf_; ///
alias tzrzf_ = stzrzf_; ///
alias tzrzf_ = dtzrzf_; ///
alias tzrzf_ = ctzrzf_; ///
alias tzrzf_ = ztzrzf_; ///
alias upmtr_ = cupmtr_; ///
alias upmtr_ = zupmtr_; ///
alias sytrs2_ = ssytrs2_;///
alias sytrs2_ = dsytrs2_;///
alias sytrs2_ = csytrs2_;///
alias sytrs2_ = zsytrs2_;///
alias geqrs_ = sgeqrs_;///
alias geqrs_ = dgeqrs_;///
alias geqrs_ = cgeqrs_;///
alias geqrs_ = zgeqrs_;///

