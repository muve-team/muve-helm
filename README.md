1. kubectl kustomize (테스트)

```bash
# 개발 환경
kubectl kustomize base/

# 프로덕션 환경
kubectl kustomize overlays/prod/
```

- 실제로 클러스터에 적용하지 않고 YAML 출력만 보여줍니다
- 최종적으로 생성될 리소스가 어떻게 되는지 미리 확인할 수 있습니다
- 문법이나 구성 오류를 사전에 확인할 수 있습니다
- 실제 배포 전에 안전하게 검증할 수 있습니다

2. kubectl apply (적용)

```bash
# 개발 환경
kubectl apply -k base/

# 프로덕션 환경
kubectl apply -k overlays/prod/
```

- 실제로 클러스터에 리소스를 생성/수정합니다
- 실제 환경에 변경사항이 적용됩니다
- 파드가 생성되고 서비스가 시작됩니다
- 실제 트래픽을 처리할 수 있는 상태가 됩니다

3. ArgoCD 배포

클러스터에 Secret을 먼저 적용하려면 ```kubectl apply -f overlays/prod/secrets.yaml```을 적용해야 합니다.

```bash
kubectl apply -f application.yaml
```

- GitOps 방식으로 지속적인 배포가 이루어집니다
- Git 저장소의 변경사항을 자동으로 감지하고 적용합니다
- 선언된 상태와 실제 상태를 계속 동기화합니다
- 자동 복구(self-healing)가 가능합니다

### 일반적인 작업 순서
1. kubectl kustomize로 먼저 검증
2. 문제없으면 kubectl apply로 직접 적용하거나
3. ArgoCD를 통해 자동화된 배포 진행