# Running the asciibinder container build locally

You can use the asciibinder container to build local asciidoc content without
installing asciibinder directly. To build your local asciidoc content, run any of the the
following commands from the asciidoc source folder:

```
podman run --rm -it -v `pwd`:/docs:Z quay.io/rhn_support_aireilly/ab_test asciibinder build
```

To build a specfic distro, for example, `openshift-enterprise` run:

```
podman run --rm -it -v `pwd`:/docs:Z quay.io/rhn_support_aireilly/ab_test asciibinder build -d openshift-enterprise
```
