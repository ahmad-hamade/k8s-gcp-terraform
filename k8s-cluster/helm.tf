resource "kubernetes_namespace" "_" {
  metadata {
    annotations = {
      name = var.nginxdemos_hello_ns
    }

    name = var.nginxdemos_hello_ns
  }
}

resource "helm_release" "_" {
  name      = "nginxdemos-hello"
  chart     = "../k8s-charts/nginxdemos-hello"
  namespace = var.nginxdemos_hello_ns
}
