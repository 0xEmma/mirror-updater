# mirror-updater

Cronjob container to update mirrors in k8s
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
            command:
              - /arch-clone.sh
            volumeMounts:
            - name:  mirror-pvc
              mountPath:  /ext/mirror
          restartPolicy: OnFailure
          volumes:
            - name: mirror-pvc
              persistentVolumeClaim:
                claimName: mirror-pv
```
