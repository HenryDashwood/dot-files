# dot-files

First clone this repo onto your local machine if you don't already have it

```
git clone git@github.com:HenryDashwood/dot-files.git
```

On your local machine run the line below. Note that if your username is not `ubuntu` you will want to update the first line of `.zshrc` first. `SERVICE_PROVIDER` could be `DATACRUNCH` or `EC2`.

```
sh remote_setup.sh [SERVICE_PROVIDER] [USERNAME] [REMOTE_IP_ADDRESS] [PRIVATE_KEY]
```

Then you can ssh in with

```
ssh [USERNAME]@[REMOTE_IP_ADDRESS]
```

### Notes

You might need to update the security rule to enable inbound ssh traffic to EC2 instances. See [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/authorizing-access-to-an-instance.html) for how to do that.
