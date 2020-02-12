 module setup

 implicit none

 private

 character(len=300), public       :: input_file
 character(len=300), public       :: output_file
 character(len=300), public       :: terrain_file
 character(len=300), public       :: vcoord_file

 integer, public  :: i_output
 integer, public  :: j_output
 integer                , public  :: ij_output
 logical, public :: cld_amt

 public                           :: program_setup

 contains

 subroutine program_setup

 implicit none

 integer                           :: istat

 namelist /chgres_setup/ i_output, j_output, input_file, output_file, &
                      terrain_file, vcoord_file, cld_amt

 cld_amt = .false. ! default option

 print*
 print*,"OPEN SETUP NAMELIST."
 open(43, file="./chgres_nc_gauss.nml", iostat=istat)
 if (istat /= 0) then
   print*,"FATAL ERROR OPENING NAMELIST FILE. ISTAT IS: ",istat
   stop 
 endif

 print*,"READ SETUP NAMELIST."
 read(43, nml=chgres_setup, iostat=istat)
 if (istat /= 0) then
   print*,"FATAL ERROR READING NAMELIST FILE. ISTAT IS: ",istat
   stop
 endif

 ij_output = i_output * j_output

 close(43)

 end subroutine program_setup

 end module setup