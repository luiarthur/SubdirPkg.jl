name: CompatHelper
on:
  schedule:
    - cron: 0 0 * * *
  workflow_dispatch:
jobs:
  CompatHelper:
    runs-on: ubuntu-latest
    steps:
      - name: "Add the General registry via Git"
        run: |
          import Pkg
          ENV["JULIA_PKG_SERVER"] = ""
          Pkg.Registry.add("General")
        shell: julia --color=yes {0}
      - name: "Install CompatHelper"
        run: |
          import Pkg
          name = "CompatHelper"
          uuid = "aa819f21-2bde-4658-8897-bab36330d9b7"
          version = "3"
          Pkg.add(; name, uuid, version)
        shell: julia --color=yes {0}
      - name: "Run CompatHelper"
        run: |
          import CompatHelper
          # NOTE: For single-package repos at the top dir.
          # CompatHelper.main()
          # NOTE: For multie-package repos.
          CompatHelper.main(; subdirs=["PkgA", "PkgB"])
        shell: julia --color=yes {0}
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          COMPATHELPER_PRIV: ${{ secrets.DOCUMENTER_KEY }}
          # COMPATHELPER_PRIV: ${{ secrets.COMPATHELPER_PRIV }}