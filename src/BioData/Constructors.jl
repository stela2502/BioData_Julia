
"The most basic constructor"
struct BioData
      data::SparseMatrixCSC
      samples::DataFrame
      annotation::DataFrame
end


"Read the data from a cellexalvrR database"
BioData(file) =  BioData( file::ASCIIString )
      db = SQLite.DB(file)
      so = SQLite.query(db, "SELECT * from datavalues")
      A = sparse( map( Int64,collect(so[1]) ),  map(Int64,collect(so[2])) , map( Int64, collect(so[3]))  )
      samples = SQLite.query(db, "SELECT * from samples")
      annotation = SQLite.query(db, "SELECT * from genes")
      
      return ( BioData( data=A, samples=samples, annotation=annotation ) )
end

      