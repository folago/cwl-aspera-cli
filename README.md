# cwl-aspera-cli

Simple aspera-cli cwl wrapper.
If you run this with cwl-runner it will return a `Final process status is permanentFail`.
I think the reason is that ascp does not returns 0 on success.

```bash
$ export ASPERA_SCP_PASS=demoaspera
$ ascp --mode=send --user=aspera --host=demo.asperasoft.com myfile /Upload
myfile                                                                                                            100% 1024KB 14.3Mb/s    00:00
Completed: 1024K bytes transferred in 0 seconds
(9381K bits/sec), in 1 file.
$ echo $?
127
```

I didn't have much time to investigate, so it is possible that I am missing something.
