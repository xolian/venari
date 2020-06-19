# Bootstrap
Create certificates and persist to secrets directory, you will need your devops license.lic file here.

```
docker run -it --name venari-bootstrap --rm -v "${PWD}:/host" -v /var/run/docker.sock:/var/run/docker.sock assertsecurity/venari-bootstrap:2.0 secrets -gencerts
```

# Documentation
```
docker run -it --name venari-docs -p 8080:80 assertsecurity/venari-bootstrap docs

```
Swagger documentation https://master.venari.internal:9000/swagger/index.html

# Install
The files in this folder are designed to quickly get a Venari DevOps farm up and running for evaluation on a single machine.
Please ensure that you are able to ping `host.docker.internal`. If  not, then add an entry for it in `/etc/hosts`.

To run the farm:

```
docker-compose up
```

The docker file currently only runs a single node, but it is not resource constrained. You can add more nodes to test if desired, but you'll want to ensure you constrain memory and CPU for the nodes. Use 4 Cpu x 16GB RAM per job node container as a good starting point. If you don't have at least 8 cores, use a single container.

```
Creating venari_venarimaster_1 ...
Creating venari_authserver_1   ...
Creating venari_jobnode_1
```

# Configuration

- Download [Venari 2.0 latest MacOS Desktop App](https://assertsecurity.io/downloads/venari-ce/updates/2.0/MacOS/venari-ce-2.0.739.dmg)
- Configure your "Settings" with a remote "Master Node Address" `https://master.venari.internal:9000`, your `/etc/hosts` file should include a remote IP associated with `master.venari.internal`, also check "Ignore Certificate Errors".
- Once you select "Remote" from the Venari top menu ribbon you will be prompted from the venari authserver with a "Username" and "Password". Default values are "admin" and "password".

# Troubleshooting
If your Venari CE / Ultimate Desktop install is trying to connect and does not change state, delete your  `$HOME/.config/Assert/LocalServer_appdata/` directory.
