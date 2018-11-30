
    !-------------------------------------------------------------------------------------------------------------
    !
    !> \file    ModuleParseCS.f90
    !> \brief   A Fortran module used to store data for the ChemSage parser.
    !> \author  M.H.A. Piro 
    !> \date    Apr. 24, 2012
    !
    !> \param INFO                      A scalar integer that indicates a successful exit or identifies 
    !!                                    an error.
    !> \param nElementsCS               Number of elements in the system.
    !> \param nSolnPhasesSysCS          Number of solution phases in the system.
    !> \param nSolnPhasesSysMax         Maximum number of solution phases in a system that can be considered.
    !> \param nSpeciesPhaseCS           Number of species in a solution phase.
    !> \param nSpeciesCS                Number of species in the system (combined solution species and pure 
    !!                                    separate phases).
    !> \param nGibbsEqSpecies           Number of Gibbs energy equations for a particular species.
    !> \param nGibbsCoeff               Number of coefficients for a Gibbs energy equation.
    !> \param nMaxGibbsEqs              Maximum number of Gibbs energy equations per species.
    !> \param nParamMax                 Maximum number of parameters in a sub-system of a non-ideal solution 
    !!                                    phase.  The default is set to 4 (i.e., quaternary).
    !> \param dStoichSpeciesCS          A double real matrix representing the number of atoms of a particular 
    !!                                    elements in a species (i.e., stoichiometry matrix).
    !> \param iRegularParam             Integer matrix representing the component numbers and exponents in 
    !!                                    a regular solution phase.
    !> \param iPhase                    Integer vector containing the index of the phase that a particular
    !!                                    species belongs to.  iPhase = 0 for a pure separate phase, iPhase = -1
    !!                                    for a "dummy species", iPhase > 0 for a solution species, where the 
    !!                                    number corresponds to the solution phase index.
    !> \param iParticlesPerMoleCS       An integer vector containing the number of particles per mole of the
    !!                                    constituent species formula mass.  The default value is 1.
    !> \param cSystemTitle              A character string representing the name of the system.
    !> \param cDummy                    A dummy character variable.
    !> \param cElementName              The name of a chemical element.
    !> \param cSpeciesNameCS            The name of a species (short hand).  Note that this can be a solution 
    !!                                    species or pure condensed phase.
    !> \param cSolnPhaseName            The name of a solution phase.
    !> \param cSolnPhaseType            The type of a solution phase.
    !> \param dGibbsDummy               An abritrary value for the molar standard Gibbs energy that is applied
    !                                    to dummy species.
    !> \param dAtomicMass               Atomic mass of an element.
    !> \param dGibbsCoeffSpeciesTemp    Temporary double array of coefficients for a Gibbs energy equation.
    !> \param nChargedPhaseCS           An integer scalar representing the number of charged phases (e.g., the
    !!                                   Compound Energy Formalism, aqueous, etc.).
    !> \param nSolnTypeSupport          An integer scalar representing the number of supported solution phase types.
    !> \param cSolnPhaseTypeSupport     A character array representing the solution phase types that are supported.
    !> \param nSublatticePhaseCS        An integer vector representing the number of sublattices per phase.  This
    !!                                   only applies to charged phases.
    !> \param nConstituentSublattice    An integer matrix representing the number of constituents per sublattice
    !!                                   for each CEF phase.
    !> \param dStoichSublattice         A double real matrix representing the stoichiometry of each sublattice
    !!                                   for each CEF Phase.
    !> \param iConstituentSublatticeCS  An integer matrix representing the coefficients of constituents on each
    !!                                   sublattice. The first dimension corresponds to the phase, the second
    !!                                   corresponds to the sublattice and the third corresponds to the constituent.
    !> \param iPhaseSublatticeCS        An integer vector representing the sublattice ID for each solution phase.
    !!                                   This value is equal to zero for a solution phase that does not contain
    !!                                   any sublattices.
    !
    !-------------------------------------------------------------------------------------------------------------


module ModuleParseCS
    
    implicit none
    
    SAVE
    
    integer                                     :: nElementsCS, nSpeciesCS, nSolnPhasesSysCS, INFO, nSROPhasesCS
    integer                                     :: nParamCS, nChargedPhaseCS
    integer,        parameter                   :: nSolnPhasesSysMax = 42, nMaxSublatticeCS = 5
    integer,        parameter                   :: nSolnTypeSupport = 8
    integer,        parameter                   :: nGibbsCoeff = 13, nMaxGibbsEqs = 6, nParamMax = 4
    integer,        dimension(:),   allocatable :: nSpeciesPhaseCS, nGibbsEqSpecies, iPhaseCS, iParticlesPerMoleCS
    integer,        dimension(:),   allocatable :: nParamPhaseCS, iParamPassCS, nSublatticePhaseCS, iPhaseSublatticeCS
    integer,        dimension(:,:), allocatable :: iRegularParamCS, nConstituentSublatticeCS, nPairsSROCS, iPairIDCS
    integer,        dimension(:,:,:), allocatable :: iConstituentSublatticeCS    

    real(8),        dimension(:),   allocatable :: dAtomicMass
    real(8),        dimension(:,:), allocatable :: dGibbsCoeffSpeciesTemp, dRegularParamCS, dGibbsMagneticCS, dCoordinationNumberCS
    real(8),        dimension(:,:), allocatable :: dStoichSublatticeCS, dStoichSpeciesCS
    
    character(3),   dimension(:),   allocatable :: cElementNameCS
    character(8),   dimension(:),   allocatable :: cSolnPhaseTypeCS
    character(25),  dimension(:),   allocatable :: cSolnPhaseNameCS
    character(25),  dimension(:),   allocatable :: cSpeciesNameCS
    character(8),   dimension(:,:,:), allocatable :: cConstituentNameSUBCS
    
    character(8),   dimension(nSolnTypeSupport), parameter :: cSolnPhaseTypeSupport = &
                                                    ['IDMX    ','QKTO    ','SUBL    ','RKMP    ','RKMPM   ','SUBLM   ','SUBG    ','IDWZ    ']
        
        
end module ModuleParseCS


