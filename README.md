# ClaimVM: look busy to the cloud hypervisor!
A Systemd service made for preventing Oracle Cloud Infrastructure from
reclaiming always free VMs.

https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm#compute__idleinstances

In the Systemd slice, the process named "claimvm" will run busy using only the
allocated amount of CPU time. The script loops indefinitely "BogoMips style" so
advanced intrinsics like floating-point ops are not used. This could be
important because mining certain crypto currencies like Monero[^1] requires
intensive use of FPU. Crypto-mining on OCI is against the T&C[^2].

The load processes are run in the lowest priority possible CGroup settings. When
it gets busy, they basically become deprived of CPU time.

## Install
Use the makefile. It includes the uninstall target.

```sh
git clone https://github.com/si-magic/claimvm
cd claimvm
sudo make install
```

## Usage
```
# Enable 25% load on OCI
systemctl enable --now claimvm@25.service
```

## See Also
- https://devin.com/lookbusy/

[^1]: https://github.com/tevador/randomx-sniffer
[^2]: https://www.oracle.com/contracts/cloud-services/
