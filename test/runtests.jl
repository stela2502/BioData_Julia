using BioData
using Base.Test

import Base: +, ==
dbfile = joinpath(dirname(@__FILE__),"data","database.sqlite")
data = BioData( dbfile )
