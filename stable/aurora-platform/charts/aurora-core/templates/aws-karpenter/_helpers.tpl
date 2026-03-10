{{/*
The image section for AWS Karpenter controller.
*/}}
{{- define "awsKarpenter.image" -}}
{{- if (and .Values.components.awsKarpenter.image.registry .Values.components.awsKarpenter.image.repository) }}
repository: {{ printf "%s/%s" .Values.components.awsKarpenter.image.registry .Values.components.awsKarpenter.image.repository }}
{{- else if .Values.components.awsKarpenter.image.repository }}
repository: {{ printf "%s/%s" (default "public.ecr.aws" .Values.global.container.registry) .Values.components.awsKarpenter.image.repository }}
{{- end }}
{{- if .Values.components.awsKarpenter.image.tag }}
tag: {{ .Values.components.awsKarpenter.image.tag }}
{{- end }}
{{- if .Values.components.awsKarpenter.image.pullPolicy }}
pullPolicy: {{ .Values.components.awsKarpenter.image.pullPolicy }}
{{- end }}
{{- end }}
