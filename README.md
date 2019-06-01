# afl-aws

AWS resources to quickly spin up an AFL fuzzing cluster.

The included CloudFormation will create a cluster of machines that fuzz a supplied harness.

See `examples/libpng` for a script that demonstrates how to build and package a harness with AFL instrumentation.

The harness package is a `tar.gz` consisting of a binary named `harness` and a testing corpus contained in `input`.

```
something.tar.gz:
- harness
- input/
-- file1.txt
-- file2.txt
-- file3.txt
```

## Usage

- Compile and package a harness for testing and upload to an public location.
- Create a new CloudFormation stack with the supplied `cloudformation.yaml`.
- Review parameters and set to what is appropriate your environment then launch.
- SSH into any of the machines to view progress on shared file system at `/mnt/efs/output`.

## References

- https://github.com/mirrorer/afl/blob/master/docs/parallel_fuzzing.txt
- https://raw.githubusercontent.com/awslabs/aws-cloudformation-templates/master/aws/services/AutoScaling/AutoScalingMultiAZWithNotifications.yaml
