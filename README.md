Readme
======

My own take importing my forerunner 305 data to tcx and then send those to
garmin connect.

This is based on the following work:

 -  <https://github.com/suve/importgarmin>
 -  XSLT transform and bash script from Braiden Kindt <braiden[at]braiden.org>.
 -  <https://github.com/ianmartin/garmintools>
 -  <https://github.com/La0/garmin-uploader>


## Usage

 -  From a terminal, launch the [nix] shell:

    ```bash
    $ cd .
    $ nix-shell
    # ..
    ```

    This should bring into scope the various programs you will need to complete
    this process.

 -  Using `garmintools`, extract your watch's run data under the *non version
    controlled* `./saved_runs` folder:

    ```bash
    $ mkdir -p ./saved_runs
    $ sudo GARMIN_SAVE_RUNS="$PWD/saved_runs" garmin_save_runs
    $ sudo chown -R "$USER:" ./saved_runs
    # ..
    ```

    `*.gmn` files should have been extracted to `./saved_runs` using a
    year/month folder hierarchy.

 -  Using this repository's `garmin-gmn2tcx`, convert all `*.gmn` under
    `./saved_runs` to their desired `*.tcx` representation:

    ```bash
    $ garmin-gmn2tcx
    # ..
    ```

    The `*.tcx` files should be created alongside the original `*.gmn` files.

 -  TODO: Uploading files to garmin connect using `gupload`.


[nix]: https://nixos.org/download.html
