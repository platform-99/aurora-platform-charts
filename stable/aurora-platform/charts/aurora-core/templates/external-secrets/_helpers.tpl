{{/*
Image block for External Secrets (external-secrets chart `image`/`webhook.image`/
`certController.image` keys, which expect a combined `repository` field).
*/}}
{{- define "externalSecrets.image" -}}
{{- if (and .Values.components.externalSecrets.image.registry .Values.components.externalSecrets.image.repository) }}
repository: {{ printf "%s/%s" .Values.components.externalSecrets.image.registry .Values.components.externalSecrets.image.repository }}
{{- else if .Values.components.externalSecrets.image.repository }}
repository: {{ printf "%s/%s" (default "ghcr.io" .Values.global.container.registry) .Values.components.externalSecrets.image.repository }}
{{- end }}
{{- if .Values.components.externalSecrets.image.tag }}
tag: {{ .Values.components.externalSecrets.image.tag }}
{{- end }}
{{- if .Values.components.externalSecrets.image.pullPolicy }}
pullPolicy: {{ .Values.components.externalSecrets.image.pullPolicy }}
{{- end }}
{{- end }}
