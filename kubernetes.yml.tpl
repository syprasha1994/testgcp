# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-cicd
  labels:
    app: demo-cicd
spec:
  replicas: 1
  selector:
    matchLabels:
      app: demo-cicd
  template:
    metadata:
      labels:
        app: demo-cicd
    spec:
      containers:
      - name: demo-cicd
        image: gcr.io/GOOGLE_CLOUD_PROJECT/demo-cicd:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: demo-cicd
spec:
  selector:
    app: demo-cicd
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer