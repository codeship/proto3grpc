Contains the protocol buffers proto3 compiler, gRPC, gRPC's go libraries, and grpc-gateway.

https://developers.google.com/protocol-buffers/docs/proto3  
https://github.com/google/protobuf  
https://github.com/golang/protobuf  
http://www.grpc.io  
https://github.com/grpc  
https://github.com/gengo/grpc-gateway

Assuming you have a proto file `foo.proto` in your current directory, run with:

```
docker run --volume $(pwd):/compile --workdir /compile pedge/proto3grpc protoc --go_out=. foo.proto
```
