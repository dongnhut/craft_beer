node(:meta) { 
    {
        status: "success",
        code: 200
    }
  }
node(:data) do
  Yajl::Parser.parse(yield)
end
