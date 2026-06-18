{{/* ================================================================== */}}
{{/*  ars-service-svc (Backend)                                        */}}
{{/* ================================================================== */}}

{{- define "ars-service-svc.name" -}}
{{- default "ars-service-svc" .Values.arsServiceSvc.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "ars-service-svc.fullname" -}}
{{- include "ars-service-svc.name" . }}
{{- end }}

{{- define "ars-service-svc.labels" -}}
app.kubernetes.io/name: {{ include "ars-service-svc.name" . }}
app.kubernetes.io/instance: {{ printf "%s-svc" .Values.sdlcEnvironment }}
app.kubernetes.io/component: backend
app.kubernetes.io/managed-by: Helm
{{- end }}

{{- define "ars-service-svc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ars-service-svc.name" . }}
app.kubernetes.io/instance: {{ printf "%s-svc" .Values.sdlcEnvironment }}
app.kubernetes.io/component: backend
{{- end }}

{{- define "ars-service-svc.serviceAccountName" -}}
{{- if .Values.arsService.serviceAccount.create }}
{{- default "ars-service-svc-sa" .Values.arsService.serviceAccount.name }}
{{- else }}
default
{{- end }}
{{- end }}


{{/* ================================================================== */}}
{{/*  ars-ui (Frontend)                                                */}}
{{/* ================================================================== */}}

{{- define "ars-ui.name" -}}
{{- default "ars-ui" .Values.arsUi.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "ars-ui.fullname" -}}
{{- include "ars-ui.name" . }}
{{- end }}

{{- define "ars-ui.labels" -}}
app.kubernetes.io/name: {{ include "ars-ui.name" . }}
app.kubernetes.io/instance: {{ printf "%s-ui" .Values.sdlcEnvironment }}
app.kubernetes.io/component: frontend
app.kubernetes.io/managed-by: Helm
{{- end }}

{{- define "ars-ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ars-ui.name" . }}
app.kubernetes.io/instance: {{ printf "%s-ui" .Values.sdlcEnvironment }}
app.kubernetes.io/component: frontend
{{- end }}

{{- define "ars-ui.serviceAccountName" -}}
{{- if .Values.arsService.serviceAccount.create }}
{{- default "ars-ui-sa" .Values.arsService.serviceAccount.name }}
{{- else }}
default
{{- end }}
{{- end }}
