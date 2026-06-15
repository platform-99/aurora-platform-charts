{{/*
Image block for a KEDA component (keda chart `image.keda`/`image.metricsApiServer`/
`image.webhooks` keys, which expect separate `registry` and `repository` fields).
Call with: (dict "image" .Values.components.keda.image.<component> "global" .Values.global)
*/}}
{{- define "keda.image" -}}
{{- $img := .image -}}
{{- $global := .global -}}
{{- if (and $img.registry $img.repository) }}
registry: {{ $img.registry }}
repository: {{ $img.repository }}
{{- else if $img.repository }}
registry: {{ default "ghcr.io" $global.container.registry }}
repository: {{ $img.repository }}
{{- end }}
{{- if $img.tag }}
tag: {{ $img.tag }}
{{- end }}
{{- end }}
