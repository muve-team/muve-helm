{{/*
Expand the name of the chart.
*/}}
{{- define "muve.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "muve.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "muve.labels" -}}
helm.sh/chart: {{ include "muve.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
