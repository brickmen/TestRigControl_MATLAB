% This will run through the control of the automatic measurement tool

addpath('./User Experience/');
% Introduction
fprintf('Welcome to Auto Measurements in MATLAB \n \n')
fprintf('Version 1.0  (11Apr18) Copyright (C) Michael Abbott 2018 \n')
fprintf('Contact: m.d.abbott@warwick.ac.uk \n')
fprintf('Guidance: Control the LaserAxe CNCC board \n and take measurements from oscilloscope and/or magnetometer automatically. \n It can also produce graphs as a demo or to monitor progress \n')

% User Menu
ux_prompt = 'What would you like to do? Type <h> for help: ';
ux_user_input = input(ux_prompt, 's');

switch ux_user_input
    case 'h'
        fprintf('Help Selected: Below are a list of commands that can be used, then re-run script \n')
        fprintf('  <so>   Sets Up LaserAxe and Oscilloscope \n')
%         fprintf('  <ee>   Extracts EXP results into the MATLAB Workspace \n')
%         fprintf('  <ep>   Plot an EXP slice \n')
%         fprintf('  <es>   Plot all EXP slices \n')
%         fprintf('  <fi>   Imports FEA results into the MATLAB Workspace \n')
%         fprintf('  <fe>   Extracts FEA results into the MATLAB Workspace \n')
%         fprintf('  <fp>   Plot an FEA slice \n')
%         fprintf('  <fs>   Plot all FEA slices \n')
         fprintf('  <ld>   Loads up User Interface Defaults \n')
%         fprintf('  <me>   Plot an Error Slice for mutual inductance \n')
%         fprintf('  <mc>   Plot an Error Slice for Coupling \n')
%         fprintf('  <ms>   Plot all Error slices \n')
         fprintf('  <sa>   Saves State of workspace to .mat file \n')
%         fprintf('  <t>    Tidies up workspace leaving fea and exp values \n')
%         fprintf('  <ti>   Tidies up workspace leaving imported files  \n')
%         fprintf('  <cle>  Wipes everything from the workspace and paths  \n')
    case 'ld'
        fprintf('Load defaults\n')
        set_defaults;
    case 'fi'
        fprintf('FEA Import Only\n')
        guided_import_fea;
    case 'fe'
        fprintf('FEA Extraction of data from import\n')
        guided_fea_extraction;
    case 'fp'
        fprintf('Plot FEA results for a single slice\n')
        guided_fea_plot_slice;
    case 'fs'
        fprintf('Plot all FEA slices\n')
        guided_fea_plot_all_slices;
    case 'ei'
        fprintf('EXP Import Only\n')
        guided_import_exp;
    case 'ee'
        fprintf('EXP Extraction of data from import\n')
        guided_exp_extraction;
    case 'es'
        fprintf('Plot all EXP slices\n')
        guided_exp_plot_all_slices;
    case 'ep'
        fprintf('Plot EXP results for a single slice\n')
        guided_exp_plot_slice;
    case 'me'
        fprintf('Plot Errors in Mutual results for a single slice\n')
        guided_error_mutual_plot_slice;
    case 'mc'
        fprintf('Plot Errors in Coupling results for a single slice\n')
        guided_error_coupling_plot_slice;
    case 'ms'
        fprintf('Plot all Error slices\n')
        guided_error_plot_all_slices;
    case 'sa'
        fprintf('Saves the exact state of the workspace\n')
        guided_save;
        clear;
    case 'ti'
        fprintf('Tidies Workspace except imported structures\n')
        clearvars -except ux_* fea_import exp_import
    case 't'
        fprintf('Tidies Workspace except ux_* fe_* and exp_*\n')
        clearvars -except ux_* fea_* exp_*
    case 'cle'
        fprintf('Clearing everything from the workspace and paths\n')
        restoredefaultpath;
        clear;
    otherwise
        fprintf('No or Unexpected Input, please re-run script and retry \n')
end
