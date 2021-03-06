
    !-------------------------------------------------------------------------------------------------------------
    !
    !> \file    TestThermo54.F90
    !> \brief   Spot test - 1973K with 10% Mo, 30% Pd, 60% Ru.
    !> \author  M.H.A. Piro, B.W.N. Fitzpatrick
    !
    ! DISCLAIMER
    ! ==========
    ! All of the programming herein is original unless otherwise specified.  Details of contributions to the
    ! programming are given below.
    !
    ! Revisions:
    ! ==========
    !    Date          Programmer          Description of change
    !    ----          ----------          ---------------------
    !    05/14/2013    M.H.A. Piro         Original code
    !    08/31/2018    B.W.N. Fitzpatrick  Modification to use Kaye's Pd-Ru-Tc-Mo system
    !
    ! Purpose:
    ! ========
    !> \details The purpose of this application test is to ensure that Thermochimica computes the correct
    !! results for the Pd-Ru-Tc-Mo system at 1973K with 10% Mo, 30% Pd, 60% Ru.
    !
    !-------------------------------------------------------------------------------------------------------------

program TestThermo54

    USE ModuleThermoIO
    USE ModuleThermo

    implicit none

    ! Specify units:
    cInputUnitTemperature  = 'K'
    cInputUnitPressure     = 'atm'
    cInputUnitMass         = 'moles'
    cThermoFileName        = DATA_DIRECTORY // 'Kaye_NobleMetals.dat'

    ! Specify values:
    dPressure              = 1D0
    dTemperature           = 1800D0
    dElementMass(43)       = 0.01D0        ! Tc
    dElementMass(46)       = 0.09D0        ! Pd
    dElementMass(42)       = 0.9D0        ! Mo

    ! Parse the ChemSage data-file:
    call ParseCSDataFile(cThermoFileName)

    ! Call Thermochimica:
    call Thermochimica

    ! Check results:
    if (INFOThermo == 0) then
        if (((DABS(dMolFraction(11) - 0.93597D0)/0.93597D0) < 1D-3).AND. &
        ((DABS(dMolFraction(18) - 0.495368D0)/0.495368D0) < 1D-3).AND. &
        ((DABS(dGibbsEnergySys - (-1.05595D5))/(-1.05595D5)) < 1D-3))  then
            ! The test passed:
            print *, 'TestThermo54: PASS'
            ! Reset Thermochimica:
            call ResetThermo
            call EXIT(0)
        else
            ! The test failed.
            print *, 'TestThermo54: FAIL <---'
            ! Reset Thermochimica:
            call ResetThermo
            call EXIT(1)
        end if
    else
        ! The test failed.
        print *, 'TestThermo54: FAIL <---'
        ! Reset Thermochimica:
        call ResetThermo
        call EXIT(1)
    end if

! Reset Thermochimica:
call ResetThermo

end program TestThermo54
