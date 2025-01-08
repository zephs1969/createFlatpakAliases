#!/bin/bash

    # Comments ###################################################################################################
    # (K.I.S.S = Keep it short and simple (as short as possible!)- Group commands, document code, test as you go.#
    ##############################################################################################################
    #C flatpak_aliases.sh: Search in the application path for currently installed flatpak applications ans create 
    #C for every application an alias.
    #How it works:  ...
    #Synopsis:      flatpak_aliases.sh no Options
    #Date:          08.01.2025 
    #Version:       0.1a
    #Author:        zephyrus
    #Options:   -
    #           -                                                                                                #
    ##############################################################################################################
    

    # Initialization of Variables ################################################################################
    #                                                                                                            #
    # version="0.1a"
    #C the path in which the current script is "running"...
    #C Name of the script file
    # strSCR=nscpSH.sh
    #C full qualified Path of the configfile strSCR.conf
    #D strCONF=""/""".conf"
    #                                                                                                            #
    ##############################################################################################################


    # Function Definitions #######################################################################################
    #                                                                                                            #
        usage () {
            printf "source the the script and call the function"
            exit 1
        }
        
        echoerr() {
            printf "%s\n" "$*" >&2
        }
        
        cre-flp-aliases ()
        { 
            declare strAlias;
            declare strFlatpakPath;
            strFlatpakPath="/var/lib/flatpak/app/";
            strAlias=$(find "${strFlatpakPath}"* -maxdepth 0 -type d | awk -F "/" '{ print$6 }' | awk -F "." '{print "alias "tolower($NF)"=?flatpak run "$0 " &?" }' | tr "?" "'");
            for flpAlias in "${strAlias[@]}";
            do
                eval "${flpAlias}";
                if [ "${1:-noshw}" == "show" ]; then
                    printf '%s\n' "${flpAlias}"; 
                fi
            done;
        }

    #                                                                                                            #
    ##############################################################################################################

    cre-flp-aliases "$1";
