# inspeccion.R — Tipos, columna derivada e indicadores (R)
# Completa los pasos marcados con TODO. Ejecuta desde la raíz del repositorio:
#   Rscript scripts/inspeccion.R

# TODO 1: carga data/ventas.csv
ventas <- read.csv("data/ventas.csv", stringsAsFactors = FALSE)
# TODO 2: imprime la estructura (str) para ver los tipos
#         (fija si region llegó como character o factor)
str(ventas)
# TODO 3: crea la columna derivada "ticket" = ventas / clientes
ventas$ticket <- ventas$ventas / ventas$clientes
# TODO 4: calcula e imprime:
#         - venta promedio por sucursal (aggregate o dplyr)
# Venta promedio por sucursal
venta_promedio_sucursal <- aggregate(
  ventas ~ sucursal,
  data = ventas,
  FUN = mean
)

cat("\nVenta promedio por sucursal:\n")
print(venta_promedio_sucursal)
#         - ticket promedio (ventas totales / clientes totales)
# Ticket promedio global:
# ventas totales / clientes totales
ticket_promedio <- sum(ventas$ventas) / sum(ventas$clientes)

cat(sprintf(
  "\nTicket promedio global: %.2f\n",
  ticket_promedio
))

#         - sucursal con mayor y menor venta
# Sucursal con mayor venta
indice_mayor <- which.max(ventas$ventas)

sucursal_mayor <- ventas[indice_mayor, ]

cat("\nSucursal con mayor venta:\n")
print(
  sucursal_mayor[
    c("sucursal", "ventas")
  ]
)

# Sucursal con menor venta
indice_menor <- which.min(ventas$ventas)

sucursal_menor <- ventas[indice_menor, ]

cat("\nSucursal con menor venta:\n")
print(
  sucursal_menor[
    c("sucursal", "ventas")
  ]
)


#         - región con mayor venta total

# Venta total por región
ventas_region <- aggregate(
  ventas ~ region,
  data = ventas,
  FUN = sum
)

cat("\nVenta total por región:\n")
print(ventas_region)


# Región con mayor venta total
indice_region_mayor <- which.max(
  ventas_region$ventas
)

region_mayor <- ventas_region[
  indice_region_mayor,
]

cat("\nRegión con mayor venta total:\n")
print(region_mayor)
