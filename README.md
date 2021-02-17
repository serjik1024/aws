# aws

Edit the [configuration file](etc/env.sh) and source it:
```bash
source etc/env.sh
```
```
aws cloudformation create-stack --stack-name ${stack} --template-body file://${location} --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=RecordSetName,ParameterValue=${stack}
# WAIT UNTIL THE DEPLOYMENT IS STABLE BEFORE PROCEEDING FURTHER

chmod +x ./bin/init-orchestrator-masters.sh
nohup ./bin/init-orchestrator-masters.sh &
# WAIT UNTIL THE DEPLOYMENT IS STABLE BEFORE PROCEEDING FURTHER

chmod +x ./bin/init-orchestrator-workers.sh
nohup ./bin/init-orchestrator-workers.sh &

```
