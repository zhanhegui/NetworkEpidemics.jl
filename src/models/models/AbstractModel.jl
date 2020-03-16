"""
    NotImplementedError{M}(m)

`Exception` thrown when a method from the `AbstractEpidemicModel` interface
is not implemented by a given type. Borrowed from the `LightGraphs` source code.
"""
struct NotImplementedError{M} <: Exception
    m::M
    NotImplementedError(m::M) where {M} = new{M}(m)
end

Base.showerror(io::IO, ie::NotImplementedError) = print(io, "method $(ie.m) not implemented.")

_NI(m) = throw(NotImplementedError(m))

"""
    AbstractEpidemicModel

An abstract type representing an epidemic model to be simulated with a Gillespie algorithm.
"""
abstract type AbstractEpidemicModel end


"""
    init_state(em, t)

Setup the initial state for the Gillespie simulation.
"""
init_state(em::AbstractEpidemicModel, state_0, t) = _NI("init_state")

"""
    init_rates(em, state)

Compute the rates vector `a` for the state `state`.
"""
init_rates(em::AbstractEpidemicModel, state) = _NI("init_rates")

"""
    init_output(em, state, n)

Initialize the output of the algorithm, allocating it and processing the initial `state`.
"""
init_output(em::AbstractEpidemicModel, state, n::Integer) = _NI("init_output")

"""
    update_state!(em, state, n)

Update the `state` of the simulation and the rates vector `a` with reaction `k` from the rates vector.
"""
update_state!(state, a, em::AbstractEpidemicModel, k) = _NI("update_state!")

"""
    update_output(output, state, em, n)

Update the `output` of the simulation.
"""
update_output!(output, state, em, n) = _NI("update_output!")

"""
    stop(em, state)

Specify an optional stopping criterion for the algorithm.
"""
stop(em::AbstractEpidemicModel, state) = false