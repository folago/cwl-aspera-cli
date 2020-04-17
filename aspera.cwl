cwlVersion: v1.0
class: CommandLineTool

doc: "transfer file passed from the previous task to the remote server with IBM Aspera"
hints:
  DockerRequirement:
    dockerPull: ibmcom/aspera-cli
requirements:
  EnvVarRequirement:
    envDef:
      #ASPERA_DST_PASS: $(inputs.password)
      ASPERA_SCP_PASS: $(inputs.password)

inputs:
  - id: user
    type: string
    doc: "user on behalf of er connect to the host"
    inputBinding:
      position: 1
      prefix: "--user="
      separate: false
  - id: host
    type: string
    doc: "host"
    inputBinding:
      position: 2
      prefix: "--host="
      separate: false
  - id: filesToTransfer
    type: string[]
    doc: "files to send, for now random data"
    inputBinding:
      position: 3
  - id: destDir
    type: string
    doc: "detination directory on the host"
    inputBinding:
      position: 4

#      inputBinding:
#        valueFrom: $(self.basename)
outputs:
  - id: output
    type: stdout

baseCommand: ascp
arguments: ["--mode=send"]
 