{{/*
ExternalDNS provider name for the kubernetes-sigs chart `provider.name` value.
Uses components.externalDns.provider when set; otherwise global.provider (e.g. aws, azure).
*/}}
{{- define "externalDns.provider" -}}
{{- default .Values.global.provider .Values.components.externalDns.provider -}}
{{- end }}

{{/*
Image block for external-dns (kubernetes-sigs chart `image` key).
*/}}
{{- define "externalDns.image" -}}
{{- if (and .Values.components.externalDns.image.registry .Values.components.externalDns.image.repository) }}
repository: {{ printf "%s/%s" .Values.components.externalDns.image.registry .Values.components.externalDns.image.repository }}
{{- else if .Values.components.externalDns.image.repository }}
repository: {{ printf "%s/%s" (default "registry.k8s.io" .Values.global.container.registry) .Values.components.externalDns.image.repository }}
{{- end }}
{{- if .Values.components.externalDns.image.tag }}
tag: {{ .Values.components.externalDns.image.tag }}
{{- end }}
{{- if .Values.components.externalDns.image.pullPolicy }}
pullPolicy: {{ .Values.components.externalDns.image.pullPolicy }}
{{- end }}
{{- end }}
