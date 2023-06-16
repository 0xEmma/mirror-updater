# mirror-updater

Container that updates mirrors
Example:

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: mirror-arch
  namespace: default
spec:
  schedule: "0 */5 * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: mirror-arch
            image: ghcr.io/0xemma/mirror-updater:main
            imagePullPolicy: Always
            enviorment:
              - name: TARGET
                value: /ext/media/arch
              - name: SOURCE
                value: rsync://mirrors.lug.mtu.edu/archlinux/
              - name: LASTUPDATE
                value: https://mirrors.lug.mtu.edu/archlinux/lastupdate
                #if set to first it wont wait until finish to add files/sync, + allows use of partial files, good if it breaks midway aaaaaaaa
              - name: FIRST
                value: "first"
            volumeMounts:
            - name:  mirror-pvc
              mountPath:  /ext/mirror
          restartPolicy: OnFailure
          volumes:
            - name: mirror-pvc
              persistentVolumeClaim:
                claimName: mirror-pv
```
