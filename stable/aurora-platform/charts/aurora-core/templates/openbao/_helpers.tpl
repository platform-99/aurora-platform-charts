{{/*
Image block for the OpenBao server (openbao chart `server.image` key, which expects
separate `registry` and `repository` fields).
*/}}
{{- define "openbao.server.image" -}}
{{- if (and .Values.components.openbao.server.image.registry .Values.components.openbao.server.image.repository) }}
registry: {{ .Values.components.openbao.server.image.registry }}
repository: {{ .Values.components.openbao.server.image.repository }}
{{- else if .Values.components.openbao.server.image.repository }}
registry: {{ default "quay.io" .Values.global.container.registry }}
repository: {{ .Values.components.openbao.server.image.repository }}
{{- end }}
{{- if .Values.components.openbao.server.image.tag }}
tag: {{ .Values.components.openbao.server.image.tag }}
{{- end }}
{{- if .Values.components.openbao.server.image.pullPolicy }}
pullPolicy: {{ .Values.components.openbao.server.image.pullPolicy }}
{{- end }}
{{- end }}
