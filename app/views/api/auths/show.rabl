object @auth
  extends "customers/_attributes"
  glue :api_key,  object_root: false do
    extends "api_keys/_attributes" 
  end
