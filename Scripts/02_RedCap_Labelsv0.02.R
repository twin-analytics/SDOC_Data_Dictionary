#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('Data/SmartDischargesForOl_DATA_2026-05-06_0407.csv')
#Setting Labels

label(data$studyid_adm) = "Study ID"
label(data$redcap_event_name) = "Event Name"
label(data$redcap_data_access_group) = "Data Access Group"
label(data$creationdate_adm) = "Date of creation"
label(data$uploaddate_adm) = "Date of upload"
label(data$appversion_adm) = "App version"
label(data$is_pilot_adm) = "Enrolled as part of pilot phase?"
label(data$country_adm) = "Country of enrollment"
label(data$site_adm) = "Site of enrollment"
label(data$username_adm) = "Username"
label(data$nursename_adm) = "Name of study nurse entering enrolment information"
label(data$nursenameother_adm) = "Other:"
label(data$ageadmit_adm) = "Is the child of eligible age?"
label(data$studygroup_adm) = "Which study group is this child a part of?"
label(data$infection_adm) = "Is the child admitted with a proven or suspected infection?"
label(data$excludeadmit_adm) = "What is the reason for admission?"
label(data$exclusionother_adm) = "Do any of the following apply? (Choose the most applicable)"
label(data$consenttype_adm) = "Consent type"
label(data$consentobtained_adm) = "Consent obtained"
label(data$admitdate_adm) = "Date of admission"
label(data$admittime_adm) = "Time of admission (Use 24-hour time)"
label(data$admitampm_adm) = "AM/PM"
label(data$firstname_adm) = "First name"
label(data$lastname_adm) = "Last name"
label(data$nickname_adm) = "Nickname (name known at home)"
label(data$contactname_adm) = "Contact name"
label(data$othercontactname_adm) = "Other names of contact"
label(data$languages_adm___1) = "Languages spoken (choice=English)"
label(data$languages_adm___2) = "Languages spoken (choice=Runyankore)"
label(data$languages_adm___3) = "Languages spoken (choice=Luganda)"
label(data$languages_adm___4) = "Languages spoken (choice=Lusoga)"
label(data$languages_adm___5) = "Languages spoken (choice=Kinyarwanda)"
label(data$languages_adm___6) = "Languages spoken (choice=Kiswahili)"
label(data$languages_adm___7) = "Languages spoken (choice=French)"
label(data$excludephone_adm) = "Does the childs caregiver have access to a phone for follow-up?"
label(data$phone1_adm) = "Phone number"
label(data$verifyphone1_adm) = "Verify phone number"
label(data$phone1own_adm) = "Who owns the phone assocated with this phone number?"
label(data$phone1other_adm) = "If other, please specify"
label(data$phone1name_adm) = "Name of the owner of this phone"
label(data$phone2_adm) = "Alternative phone number"
label(data$verifyphone2_adm) = "Verify alternative phone number"
label(data$phone2own_adm) = "Who owns the phone assocated with this phone number?"
label(data$phone2other_adm) = "If other, please specify"
label(data$phone2name_adm) = "Name of the owner of this phone"
label(data$phonetime_adm___1) = "What time of the day would you wish to be contacted on phone during follow-up of your child? (choice=07 - 09)"
label(data$phonetime_adm___2) = "What time of the day would you wish to be contacted on phone during follow-up of your child? (choice=09 - 12)"
label(data$phonetime_adm___3) = "What time of the day would you wish to be contacted on phone during follow-up of your child? (choice=12 - 15)"
label(data$phonetime_adm___4) = "What time of the day would you wish to be contacted on phone during follow-up of your child? (choice=15 - 18)"
label(data$phonetime_adm___96) = "What time of the day would you wish to be contacted on phone during follow-up of your child? (choice=Any time)"
label(data$wellknownperson_adm) = "Name of a well-known/prominent individual in your community who knows you who we can reach out to during follow up"
label(data$wellknownphone_adm) = "Phone number of well-known/prominent individual"
label(data$verifywellknownphone_adm) = "Verify phone number of well-known/prominent individual"
label(data$chwphone_adm) = "Phone number of Community Health Worker in patient area (if known)"
label(data$verifychwphone_adm) = "Verify CHW phone number"
label(data$chwname_adm) = "Name of CHW"
label(data$attendant_adm) = "Who brought the child to the hospital?"
label(data$attendantother_adm) = "If other, please specify"
label(data$attendantsex_adm) = "Sex of the person who brought the child to the hospital"
label(data$attendantage_adm) = "Age of the person who brought the child to the hospital"
label(data$isprimarycaregiver_adm) = "Is the person who brought the child to the hospital the childs primary caregiver?"
label(data$childresidence_adm) = "Where does the child live?"
label(data$childresidenceother_adm) = "Other place:"
label(data$boardingschool_adm) = "Name of boarding school"
label(data$districtschoolug_adm) = "District of boarding school"
label(data$subcountyschoolug_adm) = "Sub-county of boarding school"
label(data$parishschoolug_adm) = "Parish of boarding school"
label(data$villageschoolug_adm) = "Village of boarding school"
label(data$countyschoolug_adm) = "County/Constituency of boarding school"
label(data$provinceschoolrw_adm) = "Province of boarding school"
label(data$districtschoolrw_adm) = "District of boarding school"
label(data$sectorschoolrw_adm) = "Sector of boarding school"
label(data$cellschoolrw_adm) = "Cell of boarding school"
label(data$villageschoolrw_adm) = "Village of boarding school"
label(data$regionschooltz_adm) = "Region of boarding school"
label(data$districtschooltz_adm) = "District of boarding school"
label(data$wardschooltz_adm) = "Ward of boarding school"
label(data$vitongojischooltz_adm) = "Vitongoji of boarding school"
label(data$streetschooltz_adm) = "Street of boarding school"
label(data$schoolprincipal_adm) = "Name of Boarding School Principal"
label(data$districtresidenceug_adm) = "District of home residence"
label(data$subcountyresidenceug_adm) = "Sub-county of home residence"
label(data$parishresidenceug_adm) = "Parish of home residence"
label(data$villageresidenceug_adm) = "Village of home residence"
label(data$countyresidenceug_adm) = "County/Constituency of home residence"
label(data$provinceresidencerw_adm) = "Province of home residence"
label(data$districtresidencerw_adm) = "District of home residence"
label(data$sectorresidencerw_adm) = "Sector of home residence"
label(data$cellresidencerw_adm) = "Cell of home residence"
label(data$villageresidencerw_adm) = "Village of home residence"
label(data$regionresidencetz_adm) = "Region of home residence"
label(data$districtresidencetz_adm) = "District of home residence"
label(data$wardresidencetz_adm) = "Ward of home residence"
label(data$vitongojiresidencetz_adm) = "Vitongoji of home residence"
label(data$postalresidencetz_adm) = "Postal code of home residence"
label(data$streetresidencetz_adm) = "Street of home residence"
label(data$housenumberresidencetz_adm) = "House number of home residence"
label(data$landmark_adm) = "Locally known landmark nearby to home residence"
label(data$chairmanresidence_adm) = "Chairman of home residence"
label(data$chairmanphone_adm) = "Chairman phone number"
label(data$verifychairmanphone_adm) = "Verify chairman phone number"
label(data$socialhw_adm) = "Name of Social Health Worker"
label(data$socialhwphone_adm) = "Phone number of Social Health Worker"
label(data$verifysocialhwphone_adm) = "Verify phone number of Social Health Worker"
label(data$findcomments_adm) = "Other information that can help us find this child for followup"
label(data$dobknown_adm) = "Is exact date of birth known?"
label(data$yob_adm) = "Year of birth"
label(data$mob_adm) = "Estimated month of birth"
label(data$dob_adm) = "Date of birth"
label(data$agecalc_adm) = "Age at admission (in months)"
label(data$sex_adm) = "Sex"
label(data$priorcare_adm) = "Has care been sought for this current illness prior to this admission"
label(data$isreferral_adm) = "Is this visit a referral?"
label(data$referralsource_adm) = "Referral source (if not a referral enter previous source of care seeking)"
label(data$otherstudy_adm) = "Is this child a part of any other study ?"
label(data$otherstudy_checkbox_adm___1) = "Specify which studies (choice=Blood biobank sub-study)"
label(data$otherstudy_checkbox_adm___2) = "Specify which studies (choice=Smart O2)"
label(data$otherstudy_checkbox_adm___3) = "Specify which studies (choice=ADAPT)"
label(data$otherstudy_checkbox_adm___4) = "Specify which studies (choice=MAPCKD)"
label(data$otherstudy_checkbox_adm___5) = "Specify which studies (choice=HUT)"
label(data$otherstudy_checkbox_adm___6) = "Specify which studies (choice=NOD)"
label(data$otherstudy_checkbox_adm___7) = "Specify which studies (choice=SPARCO)"
label(data$otherstudy_checkbox_adm___8) = "Specify which studies (choice=TB Algorithm)"
label(data$otherstudy_checkbox_adm___9) = "Specify which studies (choice=PLUS 2)"
label(data$otherstudy_checkbox_adm___98) = "Specify which studies (choice=Other)"
label(data$otherstudy_selection_adm) = "Other study "
label(data$comment1_details) = "Comments"
label(data$comment2_details) = "Comments"
label(data$patient_details_complete) = "Complete?"
label(data$consent_version) = "Consent version"
label(data$consent_storage_version) = "Consent storage version"
label(data$consent_language) = "Consent language"
label(data$consent_form_type) = "Consent form type"
label(data$consent_future_research) = "Are you willing to be contacted for future research?"
label(data$consent_phone_number) = "Phone number:"
label(data$consent_partcg_name) = "Name of participants caregiver"
label(data$consent_partcg_consent) = "X"
label(data$consent_partcg_consent_2) = "X"
label(data$consent_partcg_consent_3) = "X"
label(data$consent_partcg_consent_4) = "X"
label(data$consent_partcg_consent_5) = "X"
label(data$consent_partcg_consent_6) = "X"
label(data$consent_partcg_date) = "Date of participants caregiver consent"
label(data$consent_participant_name) = "Name of participant"
label(data$consent_consent) = "X"
label(data$consent_consent_2) = "X"
label(data$consent_consent_3) = "X"
label(data$consent_consent_4) = "X"
label(data$consent_consent_5) = "X"
label(data$consent_consent_6) = "X"
label(data$consent_storage) = "X"
label(data$consent_storage_2) = "X"
label(data$consent_storage_3) = "X"
label(data$consent_storage_4) = "X"
label(data$consent_participant_date) = "Date of participant consent"
label(data$consent_participant_age) = "Is the child 8 years of age or older?"
label(data$consent_assent) = "Did the child provide verbal assent to participate?"
label(data$consent_participant_age2) = "Is the child 9 years of age or older?"
label(data$consent_participant_age3) = "Is the child 10 years of age or older?"
label(data$consent_assent_version) = "Assent form version"
label(data$consent_assent_written) = "Did the child provide written assent to participate?"
label(data$consent_witness_confirm) = "Witness confirmation (if applicable)"
label(data$consent_witness_storage) = "Witness confirmation for biological sample storage"
label(data$consent_witness_name) = "Name of witness"
label(data$consent_witness_date) = "Date of witness confirmation"
label(data$consent_studystaff_name) = "Name of study staff obtaining e-consent"
label(data$consent_studystaff_confirm) = "Study staff confirmation"
label(data$consent_studystaff_storage) = "Study staff confirmation for biological sample storage"
label(data$consent_studystaff_date) = "Date of study staff confirmation"
label(data$consent_signature_photo) = "Photo of signature on paper consent form"
label(data$consent_storage_photo) = "Photo of signature on paper biological sample storage consent form"
label(data$consent_assent_signature_photo) = "Photo of signature on paper assent form"
label(data$consent_form_storage_complete) = "Complete?"
label(data$maternalsubstance_adm___1) = "Maternal substance use in last 30 days (check all that apply) (choice=Leaves child home alone to drink)"
label(data$maternalsubstance_adm___2) = "Maternal substance use in last 30 days (check all that apply) (choice=Drinks more than 3 times in a week)"
label(data$maternalsubstance_adm___3) = "Maternal substance use in last 30 days (check all that apply) (choice=Consumes > 6U alcohol in 1 sitting)"
label(data$maternalsubstance_adm___4) = "Maternal substance use in last 30 days (check all that apply) (choice=Smoking daily)"
label(data$maternalsubstance_adm___96) = "Maternal substance use in last 30 days (check all that apply) (choice=None apply)"
label(data$maternalsubstance_adm___97) = "Maternal substance use in last 30 days (check all that apply) (choice=Dont know)"
label(data$height_cm_adm) = "Height or length (in cm)"
label(data$weight_kg_adm) = "Weight (in kg)"
label(data$muac_mm_adm) = "MUAC (in mm)"
label(data$rr_brpm_app_adm) = "Respiratory rate"
label(data$rr2_brpm_app_adm) = "Respiratory rate 2"
label(data$sysbp_mmhg_adm) = "Systolic blood pressure"
label(data$diasbp_mmhg_adm) = "Diastolic blood pressure"
label(data$temp_c_adm) = "Axillary temperature (Celsius)"
label(data$vsdate_adm) = "On what date were vital signs measured?"
label(data$vstime_adm) = "At what time were vital signs measured? (Use 24-hour time)"
label(data$vsampm_adm) = "AM/PM"
label(data$spo2site1_pc_oxi_adm) = "Tablet oxygen saturation (measure 1)"
label(data$spo2site2_pc_oxi_adm) = "Tablet oxygen saturation (measure 2)"
label(data$spo2other_adm) = "SpO2 from other device (if tablet SpO2 not working)"
label(data$hr_bpm_adm) = "Heart rate"
label(data$spo2onoxy_adm) = "Was SpO2 measured while on oxygen?"
label(data$oxygenavail_adm) = "What is the childs supplementary oxygen status?"
label(data$respdistress_adm) = "Does the child have severe respiratory distress (grunting/severe chest indrawing)?"
label(data$caprefill_adm) = "Does the child have a capillary refill of 3 or more seconds?"
label(data$bcseye_adm) = "Eye movement (Blantyre Coma Scale)"
label(data$bcsmotor_adm) = "Best motor response (Blantyre Coma Scale)"
label(data$bcsverbal_adm) = "Best verbal response (Blantyre Coma Scale)"
label(data$prostration_adm) = "Does the child have prostration?"
label(data$admitabx_adm___1) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV Ampicillin or Amoxicillin)"
label(data$admitabx_adm___2) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO Ampicillin/Amoxicillin)"
label(data$admitabx_adm___3) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV Penicillin)"
label(data$admitabx_adm___4) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO Penicillin)"
label(data$admitabx_adm___5) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV cloxacilllin)"
label(data$admitabx_adm___6) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO Amoxicillin-clavulanic acid)"
label(data$admitabx_adm___7) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO cefpodoxime or cefuroxime)"
label(data$admitabx_adm___8) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV ceftriaxone)"
label(data$admitabx_adm___9) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV gentamicin)"
label(data$admitabx_adm___10) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO or IV ciprofloxacin or levofloxacin)"
label(data$admitabx_adm___11) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO nalidixic acid)"
label(data$admitabx_adm___12) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV vancomycin)"
label(data$admitabx_adm___13) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO Sulfamethoxazole trimethoprim)"
label(data$admitabx_adm___14) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV or PO metronidazole)"
label(data$admitabx_adm___15) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV or PO Albendazole or mebendazole)"
label(data$admitabx_adm___16) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV or PO antimalarial)"
label(data$admitabx_adm___17) = "What anti-infective(s) were given at admission (check all that apply)? (choice=TB  medications)"
label(data$admitabx_adm___18) = "What anti-infective(s) were given at admission (check all that apply)? (choice=HIV medications)"
label(data$admitabx_adm___19) = "What anti-infective(s) were given at admission (check all that apply)? (choice=Malaria medications)"
label(data$admitabx_adm___22) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV cefotaxime)"
label(data$admitabx_adm___23) = "What anti-infective(s) were given at admission (check all that apply)? (choice=IV meropenem)"
label(data$admitabx_adm___24) = "What anti-infective(s) were given at admission (check all that apply)? (choice=PO azithromycin/erythomycin)"
label(data$admitabx_adm___98) = "What anti-infective(s) were given at admission (check all that apply)? (choice=Other (specify))"
label(data$admitabx_adm___96) = "What anti-infective(s) were given at admission (check all that apply)? (choice=None)"
label(data$admitabxother_adm) = "If other, please specify"
label(data$bcgscar_adm) = "Has BCG scar? (if < 6m, verbal report of vaccine OK)"
label(data$vaccmeasles_adm) = "Has the child received a measles vaccination?"
label(data$vaccmeaslessource_adm) = "What is the source of the information regarding measles vaccination?"
label(data$vaccpneumoc_adm) = "Has the child received a pneumococcal vaccination?"
label(data$vaccpneumocsource_adm) = "What is the source of the information regarding pneumococcal vaccination?"
label(data$vaccdpt_adm) = "Has the child received a DPT/Penta vaccination?"
label(data$vaccdptsource_adm) = "What is the source of the information regarding DPT/Penta vaccination?"
label(data$priorweekabx_adm) = "Has the child used antibiotics in the past week?"
label(data$priorweekantimal_adm) = "Has the child used antimalarials in the past week?"
label(data$symptoms_adm___1) = "Symptoms during the course of this illness (check all that apply)? (choice=Rash)"
label(data$symptoms_adm___2) = "Symptoms during the course of this illness (check all that apply)? (choice=Cough < 14 days)"
label(data$symptoms_adm___3) = "Symptoms during the course of this illness (check all that apply)? (choice=Cough 14 days or more)"
label(data$symptoms_adm___4) = "Symptoms during the course of this illness (check all that apply)? (choice=Diarrhea < 14 days)"
label(data$symptoms_adm___5) = "Symptoms during the course of this illness (check all that apply)? (choice=Diarrhea 14 days or more)"
label(data$symptoms_adm___6) = "Symptoms during the course of this illness (check all that apply)? (choice=Fever/hotness of body < 7 days)"
label(data$symptoms_adm___7) = "Symptoms during the course of this illness (check all that apply)? (choice=Fever/hotness of body 7 days or more)"
label(data$symptoms_adm___8) = "Symptoms during the course of this illness (check all that apply)? (choice=Vomiting everything)"
label(data$symptoms_adm___9) = "Symptoms during the course of this illness (check all that apply)? (choice=Abnormally sleepy)"
label(data$symptoms_adm___10) = "Symptoms during the course of this illness (check all that apply)? (choice=Swelling of both feet)"
label(data$symptoms_adm___11) = "Symptoms during the course of this illness (check all that apply)? (choice=Changes in urine color)"
label(data$symptoms_adm___12) = "Symptoms during the course of this illness (check all that apply)? (choice=Making less urine than usual)"
label(data$symptoms_adm___13) = "Symptoms during the course of this illness (check all that apply)? (choice=Blood in stool)"
label(data$symptoms_adm___14) = "Symptoms during the course of this illness (check all that apply)? (choice=Seizure/convulsions)"
label(data$symptoms_adm___15) = "Symptoms during the course of this illness (check all that apply)? (choice=Coma)"
label(data$symptoms_adm___96) = "Symptoms during the course of this illness (check all that apply)? (choice=None)"
label(data$symptoms_adm___97) = "Symptoms during the course of this illness (check all that apply)? (choice=Dont know)"
label(data$urine_adm) = "Urine production in last 24h"
label(data$urinesymp_adm) = "Has the child had changes in urine color?"
label(data$urinecolor_adm) = "If yes, what is the color?"
label(data$teaprobtime_adm) = "If tea colored, for how long has the child had this problem?"
label(data$teareptepi_adm) = "Has the child had repeated episodes of tea colored urine?"
label(data$urinepain_adm) = "Does the child cry or complain of pain while passing urine?"
label(data$urinepaintime_adm) = "If yes, for how long has the child had pain while passing urine?"
label(data$bloodtransfuse_adm) = "Has the child ever received a blood transfusion prior to this admission?"
label(data$transfustimes_adm) = "If yes, how many times?"
label(data$kidneydis_adm) = "Is the child known to have kidney disease?"
label(data$kidneydisspec_adm) = "If yes, specify"
label(data$swelling_adm) = "Does the child have body swelling?"
label(data$swellinglocation_adm) = "If yes, where did the swelling start?"
label(data$swellinglocationother_adm) = "If other, please specify where"
label(data$swellingtime_adm) = "If yes, how long has the child had swelling?"
label(data$pallorcojunc_adm) = "Does child have any evidence of observed severe pallor (check tongue, conjunctiva, palm, nailbed)?"
label(data$jaundice_adm) = "Does child have any evidence of jaundice?"
label(data$sucking_adm) = "Is child sucking well when breastfeeding?"
label(data$sucking_onbf_adm) = "PRIOR to this illness, when child was healthy, did he/she suck well when breastfeeding?"
label(data$tone_adm) = "Tone"
label(data$dpi_adm) = "What is the duration of the present illness at time of admission"
label(data$fontanelle_adm) = "Does child have bulging fontanelle at admission?"
label(data$dehydration_adm) = "Does child have any of watery/blood diarrhea, vomiting, poor feeding or decreased urine output?"
label(data$dehydrationappearance_adm) = "WHO Dehydration status (general appearance)"
label(data$dehydrationeyes_adm) = "WHO Dehydration status (eyes)"
label(data$dehydrationthirst_adm) = "WHO Dehydrations status (thirst)"
label(data$dehydrationturgor_adm) = "WHO Dehydration status (skin turgor)"
label(data$abdomen_adm) = "Does the child have abdominal distension at time of admission?"
label(data$hivquestions_adm___1) = "HIV related questions (tick all that apply) (choice=RDT positive)"
label(data$hivquestions_adm___2) = "HIV related questions (tick all that apply) (choice=RDT negative)"
label(data$hivquestions_adm___3) = "HIV related questions (tick all that apply) (choice=No RDT result)"
label(data$hivquestions_adm___4) = "HIV related questions (tick all that apply) (choice=Currently on ART)"
label(data$hivquestions_adm___5) = "HIV related questions (tick all that apply) (choice=Currently on septrin)"
label(data$hivquestions_adm___6) = "HIV related questions (tick all that apply) (choice=Currently followed by HIV treatment program)"
label(data$hivquestions_adm___7) = "HIV related questions (tick all that apply) (choice=Never previously tested)"
label(data$hivpcr_adm) = "Child HIV PCR Status"
label(data$gestationalage_adm) = "What was the childs gestational age at birth?"
label(data$premature_adm) = "At what gestational age was this child born"
label(data$anv_adm) = "Number of antenatal visits during pregnancy of this child"
label(data$birthcry_adm) = "Did the baby cry immediately after birth?"
label(data$timecry_adm) = "When did the baby cry?"
label(data$birthresuscitation_adm___1) = "What resuscitation did the this child receive (check all that apply) (choice=No resuscitation after birth)"
label(data$birthresuscitation_adm___2) = "What resuscitation did the this child receive (check all that apply) (choice=Oxygen)"
label(data$birthresuscitation_adm___3) = "What resuscitation did the this child receive (check all that apply) (choice=Bag mask)"
label(data$birthresuscitation_adm___4) = "What resuscitation did the this child receive (check all that apply) (choice=Suction)"
label(data$birthresuscitation_adm___5) = "What resuscitation did the this child receive (check all that apply) (choice=Drugs)"
label(data$birthresuscitation_adm___6) = "What resuscitation did the this child receive (check all that apply) (choice=Warming)"
label(data$birthresuscitation_adm___7) = "What resuscitation did the this child receive (check all that apply) (choice=Chest compression)"
label(data$birthresuscitation_adm___97) = "What resuscitation did the this child receive (check all that apply) (choice=Dont know)"
label(data$birthresuscitation_adm___98) = "What resuscitation did the this child receive (check all that apply) (choice=Other)"
label(data$birthresuscitationother_adm) = "Please specify"
label(data$deliverytype_adm) = "Mode of delivery"
label(data$cordcare_adm___1) = "Details of cord care after birth (check all that apply) (choice=Spirit/other antiseptic)"
label(data$cordcare_adm___2) = "Details of cord care after birth (check all that apply) (choice=Soap)"
label(data$cordcare_adm___3) = "Details of cord care after birth (check all that apply) (choice=Saline)"
label(data$cordcare_adm___4) = "Details of cord care after birth (check all that apply) (choice=Plain water)"
label(data$cordcare_adm___5) = "Details of cord care after birth (check all that apply) (choice=Ash)"
label(data$cordcare_adm___6) = "Details of cord care after birth (check all that apply) (choice=Herbs)"
label(data$cordcare_adm___7) = "Details of cord care after birth (check all that apply) (choice=Cow dung)"
label(data$cordcare_adm___8) = "Details of cord care after birth (check all that apply) (choice=Saliva)"
label(data$cordcare_adm___9) = "Details of cord care after birth (check all that apply) (choice=Other traditional method)"
label(data$cordcare_adm___0) = "Details of cord care after birth (check all that apply) (choice=None)"
label(data$maternalacute_adm) = "Is mother acutely ill now?"
label(data$maternalchronic_adm) = "Maternal chronic illness requiring ongoing treatment or follow-up (HIV, TB, mental illness, etc)"
label(data$comorbidity_adm___1) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Reactive airway disease/asthma/allergy)"
label(data$comorbidity_adm___2) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Oncologic disease)"
label(data$comorbidity_adm___3) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Cardiac disease)"
label(data$comorbidity_adm___4) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Endocrine disease (like diabetes))"
label(data$comorbidity_adm___5) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Sickle cell disease)"
label(data$comorbidity_adm___6) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Tuberculosis)"
label(data$comorbidity_adm___7) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Physical/mental/ developmental disability)"
label(data$comorbidity_adm___8) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Hydrocephalus)"
label(data$comorbidity_adm___9) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Trauma/injury)"
label(data$comorbidity_adm___98) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Other co-mobidity)"
label(data$comorbidity_adm___96) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=None)"
label(data$comorbidity_adm___97) = "Co-morbid diagnoses (check all that apply). Note: Do not include HIV, anemia or malnutrition here. (choice=Dont know)"
label(data$comorbidityother_adm) = "If other, please specify"
label(data$priorhosp_adm) = "How long has it been since your childs last hospitalization?"
label(data$priorhosp2_adm) = "Prior to this referral, how long has it been since your childs last hospitalization?"
label(data$prioryearwheeze_adm) = "Prior to this illness, has your child had wheezing in the last year?"
label(data$prioryearcough_adm) = "Prior to this illness, has your child had cough, difficulty breathing or chest indrawing in the last year?"
label(data$diarrheaoften_adm) = "Does your child have diarrhea often?"
label(data$tbcontact_adm) = "Does anyone living with the child have chronic cough, frequent fevers or weight loss?"
label(data$feedingstatus_adm) = "Current feeding/drinking status? (for both breastfed and non-breastfed participants)"
label(data$feedingstatus_onliq_adm) = "PRIOR to this illness, when child was healthy, did he/she regularly cough/choke with LIQUIDS?"
label(data$feedingstatus_onsolids_adm) = "PRIOR to this illness, when child was healthy, did he/she regularly cough/choke with SOLIDS?"
label(data$exclbreastfed_adm) = "For how many months was this child exclusively breastfed (months)?"
label(data$nonexclbreastfed_adm) = "Non-exclusive breastfeeding details"
label(data$totalbreastfed_adm) = "How long was your child breastfeed in total?"
label(data$deliveryloc_adm) = "Where was your child born?"
label(data$deliverylocother_adm) = "If other, please specify"
label(data$birthattend_adm) = "Did anyone help with the birth of your child?"
label(data$birthattendother_adm) = "If other, please specify"
label(data$duedateknown_adm) = "Do you remember the due date of this child?"
label(data$duedate_adm) = "What was your due date?"
label(data$birthdetail_adm___1) = "Please provide birth details (select any that apply) (choice=Premature)"
label(data$birthdetail_adm___2) = "Please provide birth details (select any that apply) (choice=Born small (< 2500g))"
label(data$birthdetail_adm___3) = "Please provide birth details (select any that apply) (choice=Born small (weight not known))"
label(data$birthdetail_adm___4) = "Please provide birth details (select any that apply) (choice=Twin/multiple birth)"
label(data$birthdetail_adm___5) = "Please provide birth details (select any that apply) (choice=Born at term)"
label(data$birthdetail_adm___97) = "Please provide birth details (select any that apply) (choice=Dont know)"
label(data$febrilestudy_admit) = "Child is likely to be admitted"
label(data$febrilestudy_consent_adm) = "This patient is eligible for the Severe Sepsis Ancillary Study (SSAS). Have you consented them for the study?"
label(data$febrilestudy_id_adm) = "SSAS sub-study ID from the REDCap mobile app"
label(data$commentclinical1_adm) = "Comments"
label(data$commentclinical2_adm) = "Comments"
label(data$admission_variables_clinical_complete) = "Complete?"
label(data$travelmethod_adm) = "How did you travel to the hospital?"
label(data$travelmethodother_adm) = "If other, please specify"
label(data$traveldist_adm) = "How long did it take you to travel to the hospital?"
label(data$priorhealth_adm) = "Was the child in generally good health before this illness?"
label(data$badhealthduration_adm) = "How long has the child had this problem of generally bad health?"
label(data$tradhealer_adm) = "Did you use any traditional medicine/healers prior to coming to this facility for this illness?"
label(data$caregiver_adm) = "Who is this childs primary caregiver"
label(data$caregiverother_adm) = "If other, please specify"
label(data$caregiversex_adm) = "Primary caregiver sex"
label(data$caregiverage_adm) = "Primary caregiver age"
label(data$caregivermarried_adm) = "Current marital status of primary caregiver"
label(data$momalive_adm) = "Is the childs mother alive?"
label(data$momageknown_adm) = "Is mothers age known?"
label(data$momage_adm) = "How old is the childs mother?"
label(data$momagecat_adm) = "Approximate maternal age"
label(data$momagefirstpregknown_adm) = "Is the childs mothers age at first pregnancy known?"
label(data$momagefirstpreg_adm) = "How old was the childs mother at her first pregnancy?"
label(data$momedu_adm) = "What is the education level of the childs mother?"
label(data$momhiv_adm) = "Maternal HIV status"
label(data$momhivtx_adm) = "Maternal HIV treatment status"
label(data$childedu_adm) = "Is the child currently attending school?"
label(data$childedulevel_adm) = "What is the highest level of school the child has completed?"
label(data$householdsize_adm) = "How many people sleep in the same house as the child?"
label(data$diffhome_adm) = "Has this child lived with A DIFFERENT primary caregiver, in a DIFFERENT home for at least 6 months? "
label(data$diffhome_num_adm) = "If yes, specify the number of different homes the child has lived in with a different primary caregiver"
label(data$alivechildren_adm) = "Number of children in family who are alive (including subject)"
label(data$deadchildren_adm) = "Number of children in family who have died"
label(data$watersource_adm) = "Primary water source for drinking water"
label(data$waterwalk_adm) = "Does it take you more than 30 minutes to walk from your home to the water source and back?"
label(data$waterpure_adm) = "Do you boil, filter (good sand/ceramic) or disinfect (using bleach/waterguard) all drinking water?"
label(data$cookfuel_adm___1) = "Which types of cooking fuel do you use (check all that apply)? (choice=Coal/Charcoal)"
label(data$cookfuel_adm___2) = "Which types of cooking fuel do you use (check all that apply)? (choice=Wood)"
label(data$cookfuel_adm___3) = "Which types of cooking fuel do you use (check all that apply)? (choice=Straw/Grass/shrubs)"
label(data$cookfuel_adm___4) = "Which types of cooking fuel do you use (check all that apply)? (choice=Petrol/diesel/Propane)"
label(data$cookfuel_adm___5) = "Which types of cooking fuel do you use (check all that apply)? (choice=Electricity)"
label(data$cookfuel_adm___6) = "Which types of cooking fuel do you use (check all that apply)? (choice=Kerosene or Paraffin)"
label(data$cookfuel_adm___7) = "Which types of cooking fuel do you use (check all that apply)? (choice=Biogas or woodchips)"
label(data$cookfuel_adm___8) = "Which types of cooking fuel do you use (check all that apply)? (choice=Dung)"
label(data$cookfuel_adm___98) = "Which types of cooking fuel do you use (check all that apply)? (choice=Other (specify))"
label(data$cookfuelother_adm) = "If other, please specify"
label(data$cookloc_adm) = "Where is the cooking usually done?"
label(data$food_adm) = "In the last week, did you or any household member have to eat less food than you felt you needed?"
label(data$lightfuel_adm) = "What is your primary source of lighting?"
label(data$lightother_adm) = "If other, please specify"
label(data$tobacco_adm) = "How often does anyone smoke tobacco in your house"
label(data$bednet_adm) = "Does your child sleep under a mosquito net?"
label(data$flooring_adm___1) = "Which types of flooring does ANY room in your home have? (choose ALL that apply) (choice=Earth/Dung/Sand)"
label(data$flooring_adm___2) = "Which types of flooring does ANY room in your home have? (choose ALL that apply) (choice=Temporary carpet)"
label(data$flooring_adm___3) = "Which types of flooring does ANY room in your home have? (choose ALL that apply) (choice=Permanent flooring (tile, finished wood))"
label(data$flooring_adm___4) = "Which types of flooring does ANY room in your home have? (choose ALL that apply) (choice=Cement)"
label(data$flooring_adm___98) = "Which types of flooring does ANY room in your home have? (choose ALL that apply) (choice=Other)"
label(data$flooringother_adm) = "Other flooring:"
label(data$toilettype_adm) = "What kind of toilet do members of your household usually use?"
label(data$toiletother_adm) = "Other toilet:"
label(data$toiletshare_adm) = "Do you share this toilet with anyone outside your household (i.e. those NOT living together with you)?"
label(data$appliances_adm___1) = "Does your household have any of the following items? (choose ALL that apply) (choice=Electricity (from the grid))"
label(data$appliances_adm___2) = "Does your household have any of the following items? (choose ALL that apply) (choice=A television)"
label(data$appliances_adm___3) = "Does your household have any of the following items? (choose ALL that apply) (choice=A computer)"
label(data$appliances_adm___4) = "Does your household have any of the following items? (choose ALL that apply) (choice=A refrigerator)"
label(data$appliances_adm___96) = "Does your household have any of the following items? (choose ALL that apply) (choice=None)"
label(data$possessions_adm___1) = "Do you (or someone in your household) own any of the following items? (choose ALL that apply) (choice=A smart phone)"
label(data$possessions_adm___2) = "Do you (or someone in your household) own any of the following items? (choose ALL that apply) (choice=A non-smart phone)"
label(data$possessions_adm___3) = "Do you (or someone in your household) own any of the following items? (choose ALL that apply) (choice=A bicycle)"
label(data$possessions_adm___4) = "Do you (or someone in your household) own any of the following items? (choose ALL that apply) (choice=A motorcycle)"
label(data$possessions_adm___5) = "Do you (or someone in your household) own any of the following items? (choose ALL that apply) (choice=A car or truck)"
label(data$possessions_adm___96) = "Do you (or someone in your household) own any of the following items? (choose ALL that apply) (choice=None)"
label(data$internetuse_adm) = "When was the last time that you or any other household member used the internet to learn about any health related issue? (e.g. disease, sexual/reproductive health, nutrition, etc.)"
label(data$internetuse_illness_adm) = "Did you or any other household member use the internet to learn any information about your childs current illness? "
label(data$roomcount_adm) = "How many rooms does your home contain?"
label(data$commentsocial1_adm) = "Comments"
label(data$commentsocial2_adm) = "Comments"
label(data$commentsocial3_adm) = "Comments"
label(data$admission_variables_social_complete) = "Complete?"
label(data$hemoglobin_gpdl_adm) = "Hemoglobin (g/dl)"
label(data$hemoglobin_significant_adm) = "Clinically significant hemoglobin"
label(data$hctpretransfusion_adm) = "Was above hemoglobin collected prior to any transfusion?"
label(data$hivstatus_adm) = "HIV status"
label(data$malariastatuspos_adm) = "Malaria test positive?"
label(data$lactate_mmolpl_adm) = "Lactate level (mmol/L)"
label(data$lactate_significant_adm) = "Clinically significant lactate"
label(data$lactatedate_adm) = "On what date was lactate measured?"
label(data$lactatetime_adm) = "At what time was lactate measured? (Use 24-hour time)"
label(data$lactateampm_adm) = "AM/PM"
label(data$lactate2_mmolpl_adm) = "Late lactate level (mmol/L) (optional)"
label(data$lactate2_significant_adm) = "Clinically significant late lactate"
label(data$latelactatetime_adm) = "How long after the initial lactate was the late lactate measured (in hours)?"
label(data$latelactatetimeother_adm) = "Specify other (in hours)"
label(data$glucose_mmolpl_adm) = "Blood glucose (mmol/L)"
label(data$glucose_significant_adm) = "Clinically significant blood glucose"
label(data$sun_gpdl_adm) = "Saliva Urea Nitrogen (SUN)"
label(data$creatininemgdl_adm) = "Creatinine (mg/DL)"
label(data$creatinine_significant_adm) = "Clinically significant creatinine"
label(data$creatinineumoll_adm) = "Creatinine (umol/L)"
label(data$creatinineoutside_adm) = "Creatine outside detection"
label(data$urinalysisdate_adm) = "Date when urinalysis was done"
label(data$urinalysistime_adm) = "Time when urinalysis was done (Use 24-hour time)"
label(data$urinalysisampm_adm) = "AM/PM"
label(data$cbc_adm) = "Was CBC Done?"
label(data$wbccount_adm) = "WBC count  (per microliter (× 10^9/L))"
label(data$plateletcount_adm) = "Platelet count  (x 10 ^9 /L):"
label(data$platelets_significant_adm) = "Clinically significant platelet count"
label(data$plateletcountul_adm) = "Platelet count  (uL):"
label(data$urob_umolpl_adm) = "Urobilinogen (umol/L)"
label(data$urineglucose_mmolpl_adm) = "Glucose (mmol/L)"
label(data$bilirubin_umolpl_adm) = "Bilirubin (umol/L)"
label(data$ketone_mmolpl_adm) = "Ketone (mmol/L)"
label(data$gravity_adm) = "Specific Gravity"
label(data$blood_cellspul_adm) = "Blood (cells/uL)"
label(data$ph_adm) = "pH"
label(data$protein_gpl_adm) = "Protein (g/L)"
label(data$nitritestatus_adm) = "Nitrite"
label(data$leucocytes_cellpul_adm) = "Leucocytes (cell/uL)"
label(data$ungal_col_adm) = "Sample collected for NGAL"
label(data$ungal_adm) = "Urine NGAL"
label(data$commentlab1_adm) = "Comments"
label(data$commentlab2_adm) = "Comments"
label(data$labapproval_adm) = "Lab results reviewed and approved by"
label(data$admission_variables_laboratory_complete) = "Complete?"
label(data$fss_and_pedsql_patient_details_complete) = "Complete?"
label(data$studyid_fss) = "Study ID"
label(data$studyidcheck_fss) = "Confirm Study ID"
label(data$is_fsspilot_fss) = "Is this a pilot of this form?"
label(data$visitdate_fss) = "Date of Data Collection"
label(data$agecateg_pr_psql) = "What age category are you answering today?"
label(data$mental_fss) = "Mental Status"
label(data$sensory_fss) = "Sensory Functioning"
label(data$comm_fss) = "Communication"
label(data$motor_fss) = "Motor Functioning"
label(data$feed_fss) = "Feeding"
label(data$resp_fss) = "Respiratory Status"
label(data$comments_fss) = "Comments: "
label(data$score_fss) = "Total Functional Status Score"
label(data$pf_walk_5to7_pr_psql) = "1. Walking"
label(data$pf_run_5to7_pr_psql) = "2. Running"
label(data$pf_sprt_5to7_pr_psql) = "3. Sport"
label(data$pf_lift_5to7_pr_psql) = "4. Lifting"
label(data$pf_bath_5to7_pr_psql) = "5. Bathing"
label(data$pf_chor_5to7_pr_psql) = "6. Chores"
label(data$pf_hurt_5to7_pr_psql) = "7. Hurts or aches"
label(data$pf_enrgy_5to7_pr_psql) = "8. Low Energy"
label(data$pf_walk_8to12_pr_psql) = "1. Walking"
label(data$pf_run_8to12_pr_psql) = "2. Running"
label(data$pf_sprt_8to12_pr_psql) = "3. Sport"
label(data$pf_lift_8to12_pr_psql) = "4. Lifting"
label(data$pf_bath_8to12_pr_psql) = "5. Bathing"
label(data$pf_chor_8to12_pr_psql) = "6. Chores"
label(data$pf_hurt_8to12_pr_psql) = "7. Hurts or aches"
label(data$pf_enrgy_8to12_pr_psql) = "8. Low energy"
label(data$pf_walk_13to16_pr_psql) = "1. Walking"
label(data$pf_run_13to16_pr_psql) = "2. Running"
label(data$pf_sprt_13to16_pr_psql) = "3. Sport"
label(data$pf_lift_13to16_pr_psql) = "4. Lifting"
label(data$pf_bath_13to16_pr_psql) = "5. Bathing"
label(data$pf_chor_13to16_pr_psql) = "6. Chores"
label(data$pf_hurt_13to16_pr_psql) = "7. Hurts or aches"
label(data$pf_enrgy_13to16_pr_psql) = "8. Low energy"
label(data$ef_afrd_5to7_pr_psql) = "1. Feeling afraid"
label(data$ef_sad_5to7_pr_psql) = "2. Feeling sad"
label(data$ef_angr_5to7_pr_psql) = "3. Feeling angry"
label(data$ef_sleep_5to7_pr_psql) = "4. Trouble sleeping"
label(data$ef_worry_5to7_pr_psql) = "5. Worry"
label(data$ef_afrd_8to12_pr_psql) = "1. Feeling afraid"
label(data$ef_sad_8to12_pr_psql) = "2. Feeling sad"
label(data$ef_angr_8to12_pr_psql) = "3. Feeling angry"
label(data$ef_sleep_8to12_pr_psql) = "4. Trouble sleeping"
label(data$ef_worry_8to12_pr_psql) = "5. Worry"
label(data$ef_afrd_13to16_pr_psql) = "1. Feeling afraid"
label(data$ef_sad_13to16_pr_psql) = "2. Feeling sad"
label(data$ef_angr_13to16_pr_psql) = "3. Feeling angry"
label(data$ef_sleep_13to16_pr_psql) = "4. Trouble sleeping"
label(data$ef_worry_13to16_pr_psql) = "5. Worry"
label(data$sf_getalong_5to7_pr_psql) = "1. Getting along"
label(data$sf_nofriends_5to7_pr_psql) = "2. Less friends"
label(data$sf_teas_5to7_pr_psql) = "3. Getting teased"
label(data$sf_notable_5to7_pr_psql) = "4. Less activities"
label(data$sf_keepingup_5to7_pr_psql) = "5. Keeping up with play"
label(data$sf_getalong_8to12_pr_psql) = "1. Getting along"
label(data$sf_nofriends_8to12_pr_psql) = "2. Less friends"
label(data$sf_teas_8to12_pr_psql) = "3. Getting teased"
label(data$sf_notable_8to12_pr_psql) = "4. Less activities"
label(data$sf_keepingup_8to12_pr_psql) = "5. Keeping up with play"
label(data$sf_getalong_13to16_pr_psql) = "1. Getting along "
label(data$sf_nofriends_13to16_pr_psql) = "2. Less friends"
label(data$sf_teas_13to16_pr_psql) = "3. Getting teased"
label(data$sf_notable_13to16_pr_psql) = "4. Less activities"
label(data$sf_keepingup_13to16_pr_psql) = "5. Keeping up with others"
label(data$scf_attn_5to7_pr_psql) = "1. Paying attention"
label(data$scf_frgt_5to7_pr_psql) = "2. Forgetting things"
label(data$scf_schlact_5to7_pr_psql) = "3. School activities"
label(data$scf_schlfeel_5to7_pr_psql) = "4. Missing school sick"
label(data$scf_schldr_5to7_pr_psql) = "5. Missing school doctor"
label(data$scf_attn_8to12_pr_psql) = "1. Paying attention"
label(data$scf_frgt_8to12_pr_psql) = "2. Forgetting things"
label(data$scf_schlact_8to12_pr_psql) = "3. School activities"
label(data$scf_schlfeel_8to12_pr_psql) = "4. Missing school sick"
label(data$scf_schldr_8to12_pr_psql) = "5. Missing school doctor"
label(data$scf_attn_13to16_pr_psql) = "1. Paying attention"
label(data$scf_frgt_13to16_pr_psql) = "2. Forgetting things"
label(data$scf_schlact_13to16_pr_psql) = "3. School activities"
label(data$scf_schlfeel_13to16_pr_psql) = "4. Missing school sick"
label(data$scf_schldr_13to16_pr_psql) = "5. Missing school doctor"
label(data$comments_pr_psql) = "Comments:"
label(data$prob_fdbk_pr_psql___1) = "Critical problems in administering the PQL: (choice=Comprehension of the questions)"
label(data$prob_fdbk_pr_psql___2) = "Critical problems in administering the PQL: (choice=Distracted)"
label(data$prob_fdbk_pr_psql___3) = "Critical problems in administering the PQL: (choice=Does not attend school)"
label(data$prob_fdbk_pr_psql___4) = "Critical problems in administering the PQL: (choice=Cannot understand the answer scale)"
label(data$prob_fdbk_pr_psql___6) = "Critical problems in administering the PQL: (choice=Frustration with taking too much time)"
label(data$prob_fdbk_pr_psql___7) = "Critical problems in administering the PQL: (choice=Time Constraint (rushing))"
label(data$prob_fdbk_pr_psql___10) = "Critical problems in administering the PQL: (choice=Different caregiver since last assessment)"
label(data$prob_fdbk_pr_psql___8) = "Critical problems in administering the PQL: (choice=Uninterested)"
label(data$prob_fdbk_pr_psql___98) = "Critical problems in administering the PQL: (choice=Other)"
label(data$prob_fdbk_pr_psql___96) = "Critical problems in administering the PQL: (choice=None)"
label(data$otherprob_fdbk_pr_psql) = "Other:"
label(data$time_fdbk_pr_psql) = "How long did the PQL for the caregiver take (estimate)?"
label(data$othertime_fdbk_pr_psql) = "Other:"
label(data$diff_fdbk_pr_psql___1) = "Which questions caused significant difficulty?  (choice=Physical functioning)"
label(data$diff_fdbk_pr_psql___2) = "Which questions caused significant difficulty?  (choice=Emotional functioning)"
label(data$diff_fdbk_pr_psql___3) = "Which questions caused significant difficulty?  (choice=Social functioning)"
label(data$diff_fdbk_pr_psql___4) = "Which questions caused significant difficulty?  (choice=School functioning)"
label(data$diff_fdbk_pr_psql___96) = "Which questions caused significant difficulty?  (choice=None)"
label(data$phys_fdbk_pr_psql___1) = "Which physical functioning questions caused significant difficulty? (choice=Walking)"
label(data$phys_fdbk_pr_psql___2) = "Which physical functioning questions caused significant difficulty? (choice=Running)"
label(data$phys_fdbk_pr_psql___3) = "Which physical functioning questions caused significant difficulty? (choice=Sport)"
label(data$phys_fdbk_pr_psql___4) = "Which physical functioning questions caused significant difficulty? (choice=Lifting)"
label(data$phys_fdbk_pr_psql___5) = "Which physical functioning questions caused significant difficulty? (choice=Bathing)"
label(data$phys_fdbk_pr_psql___6) = "Which physical functioning questions caused significant difficulty? (choice=Chores)"
label(data$phys_fdbk_pr_psql___7) = "Which physical functioning questions caused significant difficulty? (choice=Hurt or aches)"
label(data$phys_fdbk_pr_psql___8) = "Which physical functioning questions caused significant difficulty? (choice=Low energy)"
label(data$ef_fdbk_pr_psql___1) = "Which emotional functioning questions caused significant difficulty? (choice=Feeling afraid)"
label(data$ef_fdbk_pr_psql___2) = "Which emotional functioning questions caused significant difficulty? (choice=Feeling sad)"
label(data$ef_fdbk_pr_psql___3) = "Which emotional functioning questions caused significant difficulty? (choice=Feeling angry)"
label(data$ef_fdbk_pr_psql___4) = "Which emotional functioning questions caused significant difficulty? (choice=Trouble sleeping)"
label(data$ef_fdbk_pr_psql___5) = "Which emotional functioning questions caused significant difficulty? (choice=Worry)"
label(data$sf_fdbk_pr_psql___1) = "Which social functioning questions caused significant difficulty? (choice=Getting along)"
label(data$sf_fdbk_pr_psql___2) = "Which social functioning questions caused significant difficulty? (choice=Less friends)"
label(data$sf_fdbk_pr_psql___3) = "Which social functioning questions caused significant difficulty? (choice=Getting teased)"
label(data$sf_fdbk_pr_psql___4) = "Which social functioning questions caused significant difficulty? (choice=Less activities)"
label(data$sf_fdbk_pr_psql___5) = "Which social functioning questions caused significant difficulty? (choice=Keeping up with play)"
label(data$scf_fdbk_pr_psql___1) = "Which school functioning questions caused significant difficulty? (choice=Paying attention)"
label(data$scf_fdbk_pr_psql___2) = "Which school functioning questions caused significant difficulty? (choice=Forgetting things)"
label(data$scf_fdbk_pr_psql___3) = "Which school functioning questions caused significant difficulty? (choice=School activities)"
label(data$scf_fdbk_pr_psql___4) = "Which school functioning questions caused significant difficulty? (choice=Missing school sick)"
label(data$scf_fdbk_pr_psql___5) = "Which school functioning questions caused significant difficulty? (choice=Missing school doctor)"
label(data$pf_score_5to7_pr_psql) = "Physical Health Summary Score"
label(data$psh_score_5to7_pr_psql) = "Psychosocial Health Summary Score"
label(data$total_score_5to7_pr_psql) = "Total Score"
label(data$pf_score_8to12_pr_psql) = "Physical Health Summary Score"
label(data$psh_score_8to12_pr_psql) = "Psychosocial Health Summary Score"
label(data$totalscore_8to12_pr_psql) = "Total Score"
label(data$pf_score_13to16_pr_psql) = "Physical Health Summary Score"
label(data$psh_score_13to16_pr_psql) = "Psychosocial Health Summary Score"
label(data$totalscore_13to16_pr_psql) = "Total Score"
label(data$agechange_psql) = "If you have assessed that this child will have difficulty understanding their age-appropriate PedsQL and will need to use the Faces Scale, please indicate here:"
label(data$pf_walk_5to7_sr_psql) = "1. Walking"
label(data$pf_run_5to7_sr_psql) = "2. Running"
label(data$pf_sprt_5to7_sr_psql) = "3. Sport"
label(data$pf_lift_5to7_sr_psql) = "4. Lifting"
label(data$pf_bath_5to7_sr_psql) = "5. Bathing"
label(data$pf_chor_5to7_sr_psql) = "6. Chores"
label(data$pf_hurt_5to7_sr_psql) = "7. Hurts or aches"
label(data$pain_locat_5to7_sr_psql) = "Where in your body?"
label(data$pf_enrgy_5to7_sr_psql) = "8. Low energy"
label(data$pf_walk_8to12_sr_psql) = "1. Walking"
label(data$pf_run_8to12_sr_psql) = "2. Running"
label(data$pf_sprt_8to12_sr_psql) = "3. Sport"
label(data$pf_lift_8to12_sr_psql) = "4. Lifting"
label(data$pf_bath_8to12_sr_psql) = "5. Bathing"
label(data$pf_chor_8to12_sr_psql) = "6. Chores"
label(data$pf_hurt_8to12_sr_psql) = "7. Hurts or aches"
label(data$pain_locat_8to12_sr_psql) = "Where in your body?"
label(data$pf_enrgy_8to12_sr_psql) = "8. Low energy"
label(data$pf_walk_13to16_sr_psql) = "1. Walking"
label(data$pf_run_13to16_sr_psql) = "2. Running"
label(data$pf_sprt_13to16_sr_psql) = "3. Sport"
label(data$pf_lift_13to16_sr_psql) = "4. Lifting"
label(data$pf_bath_13to16_sr_psql) = "5. Bathing"
label(data$pf_chor_13to16_sr_psql) = "6. Chores"
label(data$pf_hurt_13to16_sr_psql) = "7. Hurts or aches"
label(data$pain_locat_13to16_sr_psql) = "Where in your body?"
label(data$pf_enrgy_13to16_sr_psql) = "8. Low energy"
label(data$ef_afrd_5to7_sr_psql) = "1. Feeling afraid"
label(data$ef_sad_5to7_sr_psql) = "2. Feeling sad"
label(data$ef_angr_5to7_sr_psql) = "3. Feeling angry"
label(data$ef_sleep_5to7_sr_psql) = "4. Trouble sleeping"
label(data$ef_worry_5to7_sr_psql) = "5. Worry"
label(data$ef_afrd_8to12_sr_psql) = "1. Feeling afraid"
label(data$ef_sad_8to12_sr_psql) = "2. Feeling sad"
label(data$ef_angr_8to12_sr_psql) = "3. Feeling angry"
label(data$ef_sleep_8to12_sr_psql) = "4. Trouble sleeping"
label(data$ef_worry_8to12_sr_psql) = "5. Worry"
label(data$ef_afrd_13to16_sr_psql) = "1. Feeling afraid"
label(data$ef_sad_13to16_sr_psql) = "2. Feeling sad"
label(data$ef_angr_13to16_sr_psql) = "3. Feeling angry"
label(data$ef_sleep_13to16_sr_psql) = "4. Trouble sleeping"
label(data$ef_worry_13to16_sr_psql) = "5. Worry"
label(data$sf_getalong_5to7_sr_psql) = "1. Getting along"
label(data$sf_nofriends_5to7_sr_psql) = "2. Less friends"
label(data$sf_teas_5to7_sr_psql) = "3. Getting teased"
label(data$sf_notable_5to7_sr_psql) = "4. Less activities"
label(data$sf_keepup_5to7_sr_psql) = "5. Keeping up with play"
label(data$sf_getalong_8to12_sr_psql) = "1. Getting along"
label(data$sf_nofriends_8to12_sr_psql) = "2. Less friends"
label(data$sf_teas_8to12_sr_psql) = "3. Getting teased"
label(data$sf_notable_8to12_sr_psql) = "4. Less activities"
label(data$sf_keepingup_8to12_sr_psql) = "5. Keeping up with play"
label(data$sf_getalong_13to16_sr_psql) = "1. Getting along"
label(data$sf_nofriends_13to16_sr_psql) = "2. Less friends"
label(data$sf_teas_13to16_sr_psql) = "3. Getting teased"
label(data$sf_notable_13to16_sr_psql) = "4. Less activities"
label(data$sf_keepingup_13to16_sr_psql) = "5. Keeping up with others"
label(data$scf_attn_5to7_sr_psql) = "1. Paying attention"
label(data$scf_frgt_5to7_sr_psql) = "2. Forgetting things"
label(data$scf_schlact_5to7_sr_psql) = "3. School activities"
label(data$scf_schlfeel_5to7_sr_psql) = "4. Missing school sick"
label(data$scf_schldr_5to7_sr_psql) = "5. Missing school doctor"
label(data$scf_attn_8to12_sr_psql) = "1. Paying attention"
label(data$scf_frgt_8to12_sr_psql) = "2. Forgetting things"
label(data$scf_schlact_8to12_sr_psql) = "3. School activities"
label(data$scf_schlfeel_8to12_sr_psql) = "4. Missing school sick"
label(data$scf_schldr_8to12_sr_psql) = "5. Missing school doctor"
label(data$scf_attn_13to16_sr_psql) = "1. Paying attention in class"
label(data$scf_frgt_13to16_sr_psql) = "2. Forgetting things"
label(data$scf_schlact_13to16_sr_psql) = "3. School activities"
label(data$scf_schlfeel_13to16_sr_psql) = "4. Missing school sick"
label(data$scf_schldr_13to16_sr_psql) = "5. Missing school doctor"
label(data$comments_8to16_sr_psql) = "Comments:"
label(data$prob_fdbk_sr_psql___1) = "Critical problems in administering PQL: (choice=Comprehension of the questions)"
label(data$prob_fdbk_sr_psql___2) = "Critical problems in administering PQL: (choice=Distracted)"
label(data$prob_fdbk_sr_psql___3) = "Critical problems in administering PQL: (choice=Does not attend school)"
label(data$prob_fdbk_sr_psql___4) = "Critical problems in administering PQL: (choice=Cannot understand the FACES tool/answer scale)"
label(data$prob_fdbk_sr_psql___5) = "Critical problems in administering PQL: (choice=Child feeling physically ill)"
label(data$prob_fdbk_sr_psql___9) = "Critical problems in administering PQL: (choice=Sleepiness)"
label(data$prob_fdbk_sr_psql___6) = "Critical problems in administering PQL: (choice=Frustration with taking too much time)"
label(data$prob_fdbk_sr_psql___7) = "Critical problems in administering PQL: (choice=Time Constraint (rushing))"
label(data$prob_fdbk_sr_psql___8) = "Critical problems in administering PQL: (choice=Uninterested)"
label(data$prob_fdbk_sr_psql___98) = "Critical problems in administering PQL: (choice=Other)"
label(data$prob_fdbk_sr_psql___96) = "Critical problems in administering PQL: (choice=None)"
label(data$otherprob_fdbk_sr_psql) = "Other:"
label(data$time_fdbk_sr_psql) = "How long did the PQL for the child take (estimate)?"
label(data$othertime_fdbk_sr_psql) = "Other:"
label(data$diff_fdbk_sr_psql___1) = "Which questions caused significant difficulty? (choice=Physical functioning)"
label(data$diff_fdbk_sr_psql___2) = "Which questions caused significant difficulty? (choice=Emotional functioning)"
label(data$diff_fdbk_sr_psql___3) = "Which questions caused significant difficulty? (choice=Social functioning)"
label(data$diff_fdbk_sr_psql___4) = "Which questions caused significant difficulty? (choice=School functioning)"
label(data$diff_fdbk_sr_psql___96) = "Which questions caused significant difficulty? (choice=None)"
label(data$pf_fdbk_sr_psql___1) = "Which physical functioning questions caused significant difficulty? (choice=Walking)"
label(data$pf_fdbk_sr_psql___2) = "Which physical functioning questions caused significant difficulty? (choice=Running)"
label(data$pf_fdbk_sr_psql___3) = "Which physical functioning questions caused significant difficulty? (choice=Sport)"
label(data$pf_fdbk_sr_psql___4) = "Which physical functioning questions caused significant difficulty? (choice=Lifting)"
label(data$pf_fdbk_sr_psql___5) = "Which physical functioning questions caused significant difficulty? (choice=Bathing)"
label(data$pf_fdbk_sr_psql___6) = "Which physical functioning questions caused significant difficulty? (choice=Chores)"
label(data$pf_fdbk_sr_psql___7) = "Which physical functioning questions caused significant difficulty? (choice=Hurt or aches)"
label(data$pf_fdbk_sr_psql___8) = "Which physical functioning questions caused significant difficulty? (choice=Low energy)"
label(data$ef_fdbk_sr_psql___1) = "Which emotional functioning questions caused significant difficulty? (choice=Feeling afraid)"
label(data$ef_fdbk_sr_psql___2) = "Which emotional functioning questions caused significant difficulty? (choice=Feeling sad)"
label(data$ef_fdbk_sr_psql___3) = "Which emotional functioning questions caused significant difficulty? (choice=Feeling angry)"
label(data$ef_fdbk_sr_psql___4) = "Which emotional functioning questions caused significant difficulty? (choice=Trouble sleeping)"
label(data$ef_fdbk_sr_psql___5) = "Which emotional functioning questions caused significant difficulty? (choice=Worry)"
label(data$sf_fdbk_sr_psql___1) = "Which social functioning questions caused significant difficulty? (choice=Getting along)"
label(data$sf_fdbk_sr_psql___2) = "Which social functioning questions caused significant difficulty? (choice=Less friends)"
label(data$sf_fdbk_sr_psql___3) = "Which social functioning questions caused significant difficulty? (choice=Getting teased)"
label(data$sf_fdbk_sr_psql___4) = "Which social functioning questions caused significant difficulty? (choice=Less activities)"
label(data$sf_fdbk_sr_psql___5) = "Which social functioning questions caused significant difficulty? (choice=Keeping up with play)"
label(data$scf_fdbk_sr_psql___1) = "Which school functioning questions caused significant difficulty?  (choice=Paying attention)"
label(data$scf_fdbk_sr_psql___2) = "Which school functioning questions caused significant difficulty?  (choice=Forgetting things)"
label(data$scf_fdbk_sr_psql___3) = "Which school functioning questions caused significant difficulty?  (choice=School activities)"
label(data$scf_fdbk_sr_psql___4) = "Which school functioning questions caused significant difficulty?  (choice=Missing school sick)"
label(data$scf_fdbk_sr_psql___5) = "Which school functioning questions caused significant difficulty?  (choice=Missing school doctor)"
label(data$pf_score_5to7_sr_psql) = "Physical Functioning Summary Score"
label(data$psh_score_5to7_sr_psql) = "Psychosocial Health Summary Score"
label(data$total_score_5_7_sr_psql) = "Total Score"
label(data$pf_score_8to12_sr_psql) = "Physical Health Summary Score"
label(data$psh_score_8to12_sr_psql) = "Psychosocial Health Summary Score"
label(data$totalscore_8to12_sr_psql) = "Total Score"
label(data$pf_score_13to16_sr_psql) = "Physical Health Summary Score"
label(data$psh_score_13to16_sr_psql) = "Psychosocial Health Summary Score"
label(data$totalscore_13to16_sr_psql) = "Total Score"
label(data$fss_and_pedsql_complete) = "Complete?"
label(data$dischdate_dis) = "Date of discharge/ referral/death"
label(data$dischtime_dis) = "Time of discharge/referral/death (Use 24-hour time)"
label(data$dischampm_dis) = "AM/PM"
label(data$nursename_dis) = "Name of nurse conducting discharge"
label(data$nursenameother_dis) = "Other:"
label(data$death_dis) = "Did child die during hospitalization?"
label(data$dischstatus_dis) = "Discharge status"
label(data$referralplace_dis) = "If child was referred to higher level of care, where was child referred to?"
label(data$referralplaceother_dis) = "If other, please specify"
label(data$damareason_dis___1) = "What was the caregivers reason for this decision? (choose all that apply) (choice=Financial constraints.)"
label(data$damareason_dis___2) = "What was the caregivers reason for this decision? (choose all that apply) (choice=Drug stock-outs.)"
label(data$damareason_dis___3) = "What was the caregivers reason for this decision? (choose all that apply) (choice=Cultural beliefs)"
label(data$damareason_dis___4) = "What was the caregivers reason for this decision? (choose all that apply) (choice=The caregiver presumes the child is well.)"
label(data$damareason_dis___5) = "What was the caregivers reason for this decision? (choose all that apply) (choice=General hospital environment)"
label(data$damareason_dis___6) = "What was the caregivers reason for this decision? (choose all that apply) (choice=Few/No health workers to provide care to their children)"
label(data$damareason_dis___7) = "What was the caregivers reason for this decision? (choose all that apply) (choice=No hope for improvement)"
label(data$damareason_dis___8) = "What was the caregivers reason for this decision? (choose all that apply) (choice=Poor/non-respectful care)"
label(data$damareason_dis___97) = "What was the caregivers reason for this decision? (choose all that apply) (choice=Dont know)"
label(data$damareason_dis___98) = "What was the caregivers reason for this decision? (choose all that apply) (choice=Other)"
label(data$otherdamareason_dis) = "Specify other reason:"
label(data$diagnosis_dis___1) = "Discharge diagnosis (choice=Malaria)"
label(data$diagnosis_dis___2) = "Discharge diagnosis (choice=Pneumonia)"
label(data$diagnosis_dis___3) = "Discharge diagnosis (choice=Bronchiolitis)"
label(data$diagnosis_dis___4) = "Discharge diagnosis (choice=URTI (cold/flu etc.))"
label(data$diagnosis_dis___5) = "Discharge diagnosis (choice=Reactive airway disease/asthma)"
label(data$diagnosis_dis___6) = "Discharge diagnosis (choice=Gastroenteritis/diarrhea)"
label(data$diagnosis_dis___7) = "Discharge diagnosis (choice=HIV/AIDS or AIDS related illness)"
label(data$diagnosis_dis___8) = "Discharge diagnosis (choice=Meningitis/encephalitis or other CNS infection)"
label(data$diagnosis_dis___9) = "Discharge diagnosis (choice=Malnutrition)"
label(data$diagnosis_dis___10) = "Discharge diagnosis (choice=Tuberculosis)"
label(data$diagnosis_dis___11) = "Discharge diagnosis (choice=Any skin or soft tissue infection)"
label(data$diagnosis_dis___12) = "Discharge diagnosis (choice=Measles)"
label(data$diagnosis_dis___13) = "Discharge diagnosis (choice=Sepsis)"
label(data$diagnosis_dis___98) = "Discharge diagnosis (choice=Other)"
label(data$diagnosisother_dis) = "If other, please specify"
label(data$deathdiagnosis_dis) = "Cause of death according to medical team"
label(data$icu_dis) = "Was the child admitted to the Intensive Care Unit?"
label(data$resp_dis) = "Did the child receive oxygen or respiratory support?"
label(data$respinterv_dis___1) = "Select all that apply (choice=Nasal Canula)"
label(data$respinterv_dis___2) = "Select all that apply (choice=Face mask)"
label(data$respinterv_dis___3) = "Select all that apply (choice=Intubation/mechanical ventilation with breathing tube)"
label(data$dialysis_dis) = "Did the child receive dialysis?"
label(data$steroids_dis) = "Did the child receive steroids (hydrocortisone, dexamethasone)?"
label(data$steroidsdate_dis) = "What was the first day the steroid was administered?"
label(data$transfusion_dis) = "Was child transfused during admission?"
label(data$feedingstatus_dis) = "Feeding at discharge (For breastfed and non-breastfed participants)"
label(data$spo2site1_pc_oxi_dis) = "Discharge oxygen saturation (measure 1)"
label(data$spo2site2_pc_oxi_dis) = "Discharge oxygen saturation (measure 2)"
label(data$spo2other_dis) = "SpO2 from other device (if tablet SpO2 not working)"
label(data$rr_brpm_app_dis) = "Discharge RR"
label(data$rr2_brpm_app_dis) = "Discharge RR 2"
label(data$weight_dis) = "Discharge weight (kg)"
label(data$temperature_dis) = "Auxilliary Temperature (Celsius)"
label(data$concern_dis) = "Do you have any concerns about your childs recovery to pre-illness state after discharge?"
label(data$concernrecov_dis) = "Worried about a very slow recovery"
label(data$concernsick_dis) = "Worried about my child getting sick again soon"
label(data$concerncare_dis) = "Dont feel properly trained/educated to care for child during recovery"
label(data$concernresourc_dis) = "Worried about lack of resources to properly care for child as HW recommended (food,transport,drugs, etc.)"
label(data$concernother_dis) = "Other concern (specify):"
label(data$concernotherspec_dis) = "Specify other concern:"
label(data$tradhealer_dis) = "Do you intend to seek care from a traditional healer during the recovery process if your child becomes ill again?"
label(data$comment1_dis) = "Comments"
label(data$comment2_dis) = "Comments"
label(data$discharge_variables_complete) = "Complete?"
label(data$studyid_ref) = "Study ID"
label(data$studyidcheck_ref) = "Confirm Study ID"
label(data$refercontactname_ref) = "Referral contact name"
label(data$refercontactnumber_ref) = "Referral contact number"
label(data$transfersuccess_ref) = "Was the child successfully transferred to a higher level of care?"
label(data$transferfail_ref) = "Why not?"
label(data$transferfailspecify_ref) = "Other:"
label(data$transfersite_ref) = "Where was the child transferred to?"
label(data$transfersiteother_ref) = "Other site:"
label(data$outcome_ref) = "Outcome of transfer"
label(data$otheroutcome_ref) = "Other outcome:"
label(data$admissionoutcome_ref) = "Outcome of admission"
label(data$referdispdate_ref) = "Date of admission outcome"
label(data$furtherreferral_ref) = "Comments (briefly describe details of referral to another higher level of care)"
label(data$referral_variables_complete) = "Complete?"
label(data$studyid_dama) = "Study ID"
label(data$studyidcheck_dama) = "Confirm Study ID"
label(data$damareason_dama___1) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=Financial constraints.)"
label(data$damareason_dama___2) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=Drug stock-outs.)"
label(data$damareason_dama___3) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=Cultural beliefs)"
label(data$damareason_dama___4) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=The caregiver presumes the child is well.)"
label(data$damareason_dama___5) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=General hospital environment)"
label(data$damareason_dama___6) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=Few/No health workers to provide care to their children)"
label(data$damareason_dama___7) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=No hope for improvement)"
label(data$damareason_dama___8) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=Poor/non-respectful care)"
label(data$damareason_dama___97) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=Dont know)"
label(data$damareason_dama___98) = "What was the caregivers reason for leaving the hospital? (choose all that apply) (choice=Other)"
label(data$otherdamareason_dama) = "Specify other reason:"
label(data$comments_dama) = "Comments"
label(data$dama_variables_complete) = "Complete?"
label(data$lost_followup) = "Is this patient lost to follow-up? Do you wish to abandon all follow-up for this person?"
label(data$lost_to_followup_complete) = "Complete?"
label(data$studyid_fol) = "Study ID"
label(data$studyidcheck_fol) = "Confirm Study ID"
label(data$username_fol) = "Username"
label(data$followdate_fol) = "Date of follow-up interview"
label(data$followtype_fol) = "Follow-up type"
label(data$latitude_fol) = "Latitude"
label(data$longitude_fol) = "Longitude"
label(data$altitude_fol) = "Altitude"
label(data$location_fol) = "Where is this follow-up being conducted?"
label(data$locationother_fol) = "Specify other:"
label(data$intervieweephone_fol) = "Phone number of the person being interviewed"
label(data$interviewee_fol) = "Relationship of the person being interviewed to the child"
label(data$intervieweeother_fol) = "If other, please specify"
label(data$intervieweesex_fol) = "Sex of the person being interviewed"
label(data$intervieweeage_fol) = "Age of the person being interviewed"
label(data$isprimarycaregiver_fol) = "Is the person being interviewed the primary caregiver of the child?"
label(data$healthstatus_fol) = "What is the current health status of your child?"
label(data$pdddateknown_fol) = "Do you know when the child died?"
label(data$pdddate_fol) = "Date the child died"
label(data$pddcaregiverpresent_fol) = "Was the primary caregiver present at the time of death?"
label(data$pddloc_fol) = "Where did the child die?"
label(data$pddcaresought_fol) = "Was care sought for this episode of illness where the child died?"
label(data$pddcaresource_fol) = "Initial source of care seeking prior to death"
label(data$pddcaretype_fol___1) = "Where was care sought for this episode of illness prior to death? (choice=Untrained Health Worker/Drug Shop)"
label(data$pddcaretype_fol___2) = "Where was care sought for this episode of illness prior to death? (choice=Volunteer Health Worker)"
label(data$pddcaretype_fol___3) = "Where was care sought for this episode of illness prior to death? (choice=Traditional Healer)"
label(data$pddcaretype_fol___4) = "Where was care sought for this episode of illness prior to death? (choice=Health Center)"
label(data$pddcaretype_fol___5) = "Where was care sought for this episode of illness prior to death? (choice=Hospital)"
label(data$pddcareloc_fol) = "Record the name and address of the hospital, health centre, or clinic where care was sought:"
label(data$pdrehosp_fol) = "Was child hospitalized since discharge?"
label(data$pdrehospnum_fol) = "How many times was child re-hospitalized since discharge?"
label(data$pdrehospplace1_fol) = "Where was the first re-hospitalization (admission)"
label(data$pdrehospplace1other_fol) = "Other:"
label(data$pdrehospdate1_fol) = "When did the first re-admission occur?"
label(data$pdrehospsource1_fol) = "Initial source of health seeking prior to first re-hospitalization"
label(data$pdrehospplace2_fol) = "Where was the second re-hospitalization?"
label(data$pdrehospplace2other_fol) = "Other:"
label(data$pdrehospdate2_fol) = "When did the second hospitalization occur?"
label(data$pdrehospsource2_fol) = "Initial source of health seeking prior to second re-hospitalization?"
label(data$internetuse_fol) = "Since [discharge or last follow-up visit], have you or anyone in your household used the internet to help guide decision making about the health and recovery of your child? "
label(data$otherstudy_fol) = "Is this child a part of any other study?"
label(data$otherstudy_selection_fol___1) = "What study (select all that apply) (choice=Blood biobank sub-study)"
label(data$otherstudy_selection_fol___2) = "What study (select all that apply) (choice=Smart O2)"
label(data$otherstudy_selection_fol___3) = "What study (select all that apply) (choice=ADAPT)"
label(data$otherstudy_selection_fol___4) = "What study (select all that apply) (choice=MAPCKD)"
label(data$otherstudy_selection_fol___5) = "What study (select all that apply) (choice=HUT)"
label(data$otherstudy_selection_fol___6) = "What study (select all that apply) (choice=NOD)"
label(data$otherstudy_selection_fol___7) = "What study (select all that apply) (choice=SPARCO)"
label(data$otherstudy_selection_fol___8) = "What study (select all that apply) (choice=TB Algorithm)"
label(data$otherstudy_selection_fol___9) = "What study (select all that apply) (choice=PLUS 2)"
label(data$otherstudy_selection_fol___98) = "What study (select all that apply) (choice=Other)"
label(data$apart_from_lpos_fol) = "Specify Other"
label(data$complete_fol) = "Is all study data in the follow-up complete?"
label(data$comment1_fol) = "Comments"
label(data$comment2_fol) = "Comments"
label(data$followup_variables_health_seeking_and_vital_status_complete) = "Complete?"
label(data$ssas_sample) = "Is the SSAS sample collected?"
label(data$ssas_nosample_reason) = "What is the reason for the missed sample?"
label(data$ssas_sample_collection_complete) = "Complete?"
label(data$studyid_pda) = "Study ID"
label(data$studyidcheck_pda) = "Confirm study ID"
label(data$followtype_pda) = "Follow-up type"
label(data$latitude_pda) = "Latitude"
label(data$longitude_pda) = "Longitude"
label(data$altitude_pda) = "Altitude"
label(data$verbalautopsydate_pda) = "Post-discharge verbal autopsy date"
label(data$interviewee_pda) = "Relationship of the person interviewed to the child"
label(data$intervieweeother_pda) = "If other, please specify"
label(data$intervieweesex_pda) = "Sex of the person being interviewed"
label(data$intervieweeage_pda) = "Age of the person being interviewed"
label(data$isprimarycaregiver_pda) = "Is the person being interviewed the primary caregiver of the child?"
label(data$accident_pda) = "Did the child suffer an injury or accident that led to death?"
label(data$accidenttype_pda___1) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Road traffic crash or injury)"
label(data$accidenttype_pda___2) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Poisoning)"
label(data$accidenttype_pda___3) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Significant fall)"
label(data$accidenttype_pda___4) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Burn or fire)"
label(data$accidenttype_pda___5) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Drowning)"
label(data$accidenttype_pda___6) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Homicide or abuse)"
label(data$accidenttype_pda___7) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Bite or sting by venomous animal)"
label(data$accidenttype_pda___98) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Other (specify))"
label(data$accidenttype_pda___97) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Dont know)"
label(data$accidenttype_pda___96) = "What kind of injury or accident did the child suffer from (select all that apply)? (choice=Refused to answer)"
label(data$accidentother_pda) = "If other, please specify"
label(data$accidentintent_pda) = "Was the injury or accident intentionally inflicted by someone else?"
label(data$illnessduration_pda) = "How long did the illness that led to death last?"
label(data$deathage_pda) = "How old (in months) was the deceased at time of death?"
label(data$deathagecalc_pda) = "Calculated age (in months) for the deceased at the time of death"
label(data$fever_pda) = "During the illness that led to death, did the child have a fever?"
label(data$feverdays_pda) = "How long did the fever last?"
label(data$feveruntildeath_pda) = "Did the fever continue until death?"
label(data$feverseverity_pda) = "How severe was the fever?"
label(data$stools_pda) = "During the illness that led to death, did the child have more frequent loose or liquid stools than usual?"
label(data$stoolsfreq_pda) = "How many stools did the child have on the day that loose or liquid stools were most frequent?"
label(data$stooluntildeath_pda) = "Did the frequent loose or liquid stools continue until death?"
label(data$cough_pda) = "During the illness that led to death, did the child have a cough?"
label(data$coughdays_pda) = "For how many days did the cough last?"
label(data$coughseverity_pda) = "Was the cough very severe?"
label(data$breathdiff_pda) = "During the illness that led to death, did the child have difficulty breathing?"
label(data$breathdiffdays_pda) = "For how many days did the difficulty breathing last?"
label(data$breathfast_pda) = "During the illness that led to death, did the child have fast breathing?"
label(data$breathfastdays_pda) = "For how many days did the fast breathing last?"
label(data$indraw_pda) = "During the illness that led to death, did the child have indrawing of the chest?"
label(data$grunt_pda) = "During the illness that led to death, did the childs breathing sound like grunting?"
label(data$convulsion_pda) = "Did the child experience any generalized convulsions or fits during the illness that led to death?"
label(data$unconscious_pda) = "Was the child unconscious during the illness that led to death?"
label(data$unconshours_pda) = "How long before death did unconsciousness start?"
label(data$stiffneck_pda) = "Did the child have a stiff neck during the illness that led to death?"
label(data$fontanelle_pda) = "Did the child have a bulging fontanelle during the illness that led to death?"
label(data$skinrash_pda) = "During the month before he/she died, did the child have a skin rash?"
label(data$skinrashdays_pda) = "How many days did the rash last?"
label(data$skinflake_pda) = "During the illness that led to death, did the childs skin flake off in patches?"
label(data$haircolor_pda) = "Did the childs hair change in color to a reddish or yellowish color?"
label(data$belly_pda) = "Did the child have a protruding belly?"
label(data$anemia_pda) = "During the illness that led to death, did the child suffer from anemia or pallor?"
label(data$armpitswell_pda) = "During the illness that led to death, did the child have swelling in the armpits?"
label(data$bleeding_pda) = "During the illness that led to death, did the child bleed from anywhere?"
label(data$skinblack_pda) = "During the illness that led to death, did the child have areas of the skin that turned black?"
label(data$causeknown_pda) = "Is the cause of death known or recorded?"
label(data$deathcause_pda) = "What was the cause of death?"
label(data$certissued_pda) = "Was a death certificate issued?"
label(data$certavail_pda) = "Is the death certificate available?"
label(data$certimmedcause_pda) = "Record the immediate cause of death from the certificate"
label(data$certothercause_pda) = "Record the other underlying causes of death from the certificate"
label(data$comment1_pda) = "Comments"
label(data$comment2_pda) = "Comments"
label(data$followup_post_discharge_autopsy_complete) = "Complete?"
label(data$sqi1_perc_oxi_adm) = "Best admission SQI"
label(data$spo2trends1_oxi_adm) = "Best admission SpO2 trend file"
label(data$spo2infra1_wav_oxi_adm) = "Best admission SpO2 waveform file"
label(data$sqi2_perc_oxi_adm) = "2nd best admission SQI"
label(data$spo2trends2_oxi_adm) = "2nd best admission SpO2 trend file"
label(data$spo2infra2_wav_oxi_adm) = "2nd best admission SpO2 waveform file"
label(data$sqi1_perc_oxi_dis) = "Best discharge SQI"
label(data$spo2trends1_oxi_dis) = "Best discharge SpO2 trend file"
label(data$spo2infra1_wav_oxi_dis) = "Best discharge SpO2 waveform file"
label(data$sqi2_perc_oxi_dis) = "2nd best discharge SQI"
label(data$spo2trends2_oxi_dis) = "2nd best discharge SpO2 trend file"
label(data$spo2infra2_wav_oxi_dis) = "2nd best discharge SpO2 waveform file"
label(data$rrate_taps) = "Respiratory Rate Taps (Admission)"
label(data$rrate2_taps) = "Respiratory Rate 2 Taps (Admission)"
label(data$rrate_taps_dis) = "Respiratory Rate Taps (Discharge)"
label(data$rrate2_taps_dis) = "Respiratory Rate 2 Taps (Discharge)"
label(data$recording_data_complete) = "Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
mapping_redcap_event_name = c(
	"hospitalization_an_arm_1" = "hospitalization and discharge",
	"2_month_discharge_arm_1" = "2 month discharge",
	"4_month_discharge_arm_1" = "4 month discharge",
	"6_month_discharge_arm_1" = "6 month discharge",
	"autopsy_arm_1" = "Autopsy",
	"12_month_discharge_arm_1" = "12 month discharge"
)
data$redcap_event_name.factor = factor(data$redcap_event_name, levels = names(mapping_redcap_event_name), labels = mapping_redcap_event_name)

mapping_redcap_data_access_group = c(
	"rwanda" = "Rwanda",
	"tanzania" = "Tanzania",
	"uganda" = "Uganda"
)
data$redcap_data_access_group.factor = factor(data$redcap_data_access_group, levels = names(mapping_redcap_data_access_group), labels = mapping_redcap_data_access_group)

mapping_is_pilot_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$is_pilot_adm.factor = factor(data$is_pilot_adm, levels = names(mapping_is_pilot_adm), labels = mapping_is_pilot_adm)

mapping_country_adm = c(
	"1" = "Uganda",
	"2" = "Rwanda",
	"3" = "Tanzania"
)
data$country_adm.factor = factor(data$country_adm, levels = names(mapping_country_adm), labels = mapping_country_adm)

mapping_site_adm = c(
	"0" = "Testing",
	"1" = "MRRH",
	"2" = "HICH",
	"9" = "UMIH",
	"3" = "JRRH",
	"4" = "CHUK",
	"5" = "Ruhengeri",
	"6" = "Masaka",
	"7" = "Bugando",
	"8" = "Sekou-Toure"
)
data$site_adm.factor = factor(data$site_adm, levels = names(mapping_site_adm), labels = mapping_site_adm)

mapping_nursename_adm = c(
	"1" = "Christine",
	"2" = "Rabecca",
	"3" = "Harriet",
	"24" = "Mackline",
	"20" = "Mildred",
	"21" = "Phionah",
	"4" = "Mary",
	"5" = "Zorah",
	"6" = "Maliza",
	"7" = "Bosco",
	"8" = "Abibu",
	"9" = "Emerthe",
	"10" = "Juliette",
	"11" = "Alphonsine",
	"12" = "Marie Chantal",
	"13" = "Sandrine",
	"14" = "Vestine",
	"15" = "Amisa",
	"16" = "Joan",
	"17" = "Emmanuel",
	"18" = "Prisca",
	"19" = "Sia",
	"22" = "Vanessa",
	"23" = "Jackline",
	"25" = "Farida",
	"26" = "Macrina",
	"98" = "Other"
)
data$nursename_adm.factor = factor(data$nursename_adm, levels = names(mapping_nursename_adm), labels = mapping_nursename_adm)

mapping_ageadmit_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$ageadmit_adm.factor = factor(data$ageadmit_adm, levels = names(mapping_ageadmit_adm), labels = mapping_ageadmit_adm)

mapping_studygroup_adm = c(
	"5" = "< 6 months",
	"6" = "6 months to < 5 years",
	"1" = "5 to < 8 years",
	"2" = "8 to < 11 years",
	"3" = "11 to < 14 years",
	"4" = "14 to < 16 years"
)
data$studygroup_adm.factor = factor(data$studygroup_adm, levels = names(mapping_studygroup_adm), labels = mapping_studygroup_adm)

mapping_infection_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$infection_adm.factor = factor(data$infection_adm, levels = names(mapping_infection_adm), labels = mapping_infection_adm)

mapping_excludeadmit_adm = c(
	"1" = "Known terminal illness (eg. cancer)",
	"2" = "Cardiac disease admission",
	"3" = "Kidney disease admission",
	"4" = "Liver disease disease admission",
	"5" = "Sickle cell disease admission",
	"6" = "Reactive airway disease or asthma admission",
	"7" = "Trauma admission",
	"8" = "Poisoning-Toxicology admission",
	"9" = "Admission for surgery",
	"10" = "Scheduled visit",
	"11" = "Admission for other non-infection cause"
)
data$excludeadmit_adm.factor = factor(data$excludeadmit_adm, levels = names(mapping_excludeadmit_adm), labels = mapping_excludeadmit_adm)

mapping_exclusionother_adm = c(
	"1" = "None apply",
	"13" = "Referred before enrolment",
	"2" = "Observation less than 24 hours",
	"3" = "Non-eligible district",
	"4" = "Scheduled appointment",
	"5" = "Already enrolled in study",
	"7" = "Language barrier",
	"8" = "Died prior to consent",
	"9" = "From refugee camp",
	"10" = "Too long since admission",
	"12" = "Declined consent after initially consenting",
	"14" = "Admitted but left immediately",
	"15" = "Direct from maternity",
	"16" = "Enrolment capacity exceeded"
)
data$exclusionother_adm.factor = factor(data$exclusionother_adm, levels = names(mapping_exclusionother_adm), labels = mapping_exclusionother_adm)

mapping_consenttype_adm = c(
	"0" = "Not given",
	"1" = "Digital",
	"2" = "Physical"
)
data$consenttype_adm.factor = factor(data$consenttype_adm, levels = names(mapping_consenttype_adm), labels = mapping_consenttype_adm)

mapping_consentobtained_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$consentobtained_adm.factor = factor(data$consentobtained_adm, levels = names(mapping_consentobtained_adm), labels = mapping_consentobtained_adm)

mapping_admitampm_adm = c(
	"1" = "AM",
	"2" = "PM"
)
data$admitampm_adm.factor = factor(data$admitampm_adm, levels = names(mapping_admitampm_adm), labels = mapping_admitampm_adm)

mapping_languages_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$languages_adm___1.factor = factor(data$languages_adm___1, levels = names(mapping_languages_adm___1), labels = mapping_languages_adm___1)

mapping_languages_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$languages_adm___2.factor = factor(data$languages_adm___2, levels = names(mapping_languages_adm___2), labels = mapping_languages_adm___2)

mapping_languages_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$languages_adm___3.factor = factor(data$languages_adm___3, levels = names(mapping_languages_adm___3), labels = mapping_languages_adm___3)

mapping_languages_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$languages_adm___4.factor = factor(data$languages_adm___4, levels = names(mapping_languages_adm___4), labels = mapping_languages_adm___4)

mapping_languages_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$languages_adm___5.factor = factor(data$languages_adm___5, levels = names(mapping_languages_adm___5), labels = mapping_languages_adm___5)

mapping_languages_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$languages_adm___6.factor = factor(data$languages_adm___6, levels = names(mapping_languages_adm___6), labels = mapping_languages_adm___6)

mapping_languages_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$languages_adm___7.factor = factor(data$languages_adm___7, levels = names(mapping_languages_adm___7), labels = mapping_languages_adm___7)

mapping_excludephone_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$excludephone_adm.factor = factor(data$excludephone_adm, levels = names(mapping_excludephone_adm), labels = mapping_excludephone_adm)

mapping_phone1own_adm = c(
	"1" = "Own phone",
	"2" = "Household member",
	"3" = "Neighbour",
	"98" = "Other"
)
data$phone1own_adm.factor = factor(data$phone1own_adm, levels = names(mapping_phone1own_adm), labels = mapping_phone1own_adm)

mapping_phone2own_adm = c(
	"1" = "Own phone",
	"2" = "Household member",
	"3" = "Neighbour",
	"98" = "Other"
)
data$phone2own_adm.factor = factor(data$phone2own_adm, levels = names(mapping_phone2own_adm), labels = mapping_phone2own_adm)

mapping_phonetime_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phonetime_adm___1.factor = factor(data$phonetime_adm___1, levels = names(mapping_phonetime_adm___1), labels = mapping_phonetime_adm___1)

mapping_phonetime_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phonetime_adm___2.factor = factor(data$phonetime_adm___2, levels = names(mapping_phonetime_adm___2), labels = mapping_phonetime_adm___2)

mapping_phonetime_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phonetime_adm___3.factor = factor(data$phonetime_adm___3, levels = names(mapping_phonetime_adm___3), labels = mapping_phonetime_adm___3)

mapping_phonetime_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phonetime_adm___4.factor = factor(data$phonetime_adm___4, levels = names(mapping_phonetime_adm___4), labels = mapping_phonetime_adm___4)

mapping_phonetime_adm___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phonetime_adm___96.factor = factor(data$phonetime_adm___96, levels = names(mapping_phonetime_adm___96), labels = mapping_phonetime_adm___96)

mapping_attendant_adm = c(
	"1" = "Biological parent",
	"2" = "Grandparent",
	"3" = "Sibling",
	"4" = "Aunt / uncle / cousin",
	"5" = "Stepmother / stepfather",
	"6" = "Care home / orphanage",
	"98" = "Other"
)
data$attendant_adm.factor = factor(data$attendant_adm, levels = names(mapping_attendant_adm), labels = mapping_attendant_adm)

mapping_attendantsex_adm = c(
	"1" = "Female",
	"2" = "Male",
	"3" = "Both",
	"99" = "N/A (in care)"
)
data$attendantsex_adm.factor = factor(data$attendantsex_adm, levels = names(mapping_attendantsex_adm), labels = mapping_attendantsex_adm)

mapping_attendantage_adm = c(
	"1" = "< 19 years",
	"2" = "19 years to < 51 years",
	"3" = "51 years or older",
	"99" = "N/A (in care)"
)
data$attendantage_adm.factor = factor(data$attendantage_adm, levels = names(mapping_attendantage_adm), labels = mapping_attendantage_adm)

mapping_isprimarycaregiver_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$isprimarycaregiver_adm.factor = factor(data$isprimarycaregiver_adm, levels = names(mapping_isprimarycaregiver_adm), labels = mapping_isprimarycaregiver_adm)

mapping_childresidence_adm = c(
	"1" = "At home",
	"2" = "Boarding school",
	"98" = "Other"
)
data$childresidence_adm.factor = factor(data$childresidence_adm, levels = names(mapping_childresidence_adm), labels = mapping_childresidence_adm)

mapping_dobknown_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$dobknown_adm.factor = factor(data$dobknown_adm, levels = names(mapping_dobknown_adm), labels = mapping_dobknown_adm)

mapping_yob_adm = c(
	"12" = "2027",
	"11" = "2026",
	"10" = "2025",
	"9" = "2024",
	"8" = "2023",
	"7" = "2022",
	"6" = "2021",
	"5" = "2020",
	"4" = "2019",
	"3" = "2018",
	"2" = "2017",
	"1" = "2016",
	"0" = "2015",
	"-1" = "2014",
	"-2" = "2013",
	"-3" = "2012",
	"-4" = "2011",
	"-5" = "2010",
	"-6" = "2009",
	"-7" = "2008",
	"-8" = "2007"
)
data$yob_adm.factor = factor(data$yob_adm, levels = names(mapping_yob_adm), labels = mapping_yob_adm)

mapping_mob_adm = c(
	"1" = "January",
	"2" = "February",
	"3" = "March",
	"4" = "April",
	"5" = "May",
	"6" = "June",
	"7" = "July",
	"8" = "August",
	"9" = "September",
	"10" = "October",
	"11" = "November",
	"12" = "December"
)
data$mob_adm.factor = factor(data$mob_adm, levels = names(mapping_mob_adm), labels = mapping_mob_adm)

mapping_sex_adm = c(
	"1" = "Male",
	"2" = "Female"
)
data$sex_adm.factor = factor(data$sex_adm, levels = names(mapping_sex_adm), labels = mapping_sex_adm)

mapping_priorcare_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$priorcare_adm.factor = factor(data$priorcare_adm, levels = names(mapping_priorcare_adm), labels = mapping_priorcare_adm)

mapping_isreferral_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$isreferral_adm.factor = factor(data$isreferral_adm, levels = names(mapping_isreferral_adm), labels = mapping_isreferral_adm)

mapping_referralsource_adm = c(
	"1" = "Other Hospital",
	"2" = "Health Center/clinic",
	"3" = "CHW",
	"4" = "Untrained Health Worker",
	"5" = "Traditional Healer",
	"98" = "Other"
)
data$referralsource_adm.factor = factor(data$referralsource_adm, levels = names(mapping_referralsource_adm), labels = mapping_referralsource_adm)

mapping_otherstudy_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$otherstudy_adm.factor = factor(data$otherstudy_adm, levels = names(mapping_otherstudy_adm), labels = mapping_otherstudy_adm)

mapping_otherstudy_checkbox_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___1.factor = factor(data$otherstudy_checkbox_adm___1, levels = names(mapping_otherstudy_checkbox_adm___1), labels = mapping_otherstudy_checkbox_adm___1)

mapping_otherstudy_checkbox_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___2.factor = factor(data$otherstudy_checkbox_adm___2, levels = names(mapping_otherstudy_checkbox_adm___2), labels = mapping_otherstudy_checkbox_adm___2)

mapping_otherstudy_checkbox_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___3.factor = factor(data$otherstudy_checkbox_adm___3, levels = names(mapping_otherstudy_checkbox_adm___3), labels = mapping_otherstudy_checkbox_adm___3)

mapping_otherstudy_checkbox_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___4.factor = factor(data$otherstudy_checkbox_adm___4, levels = names(mapping_otherstudy_checkbox_adm___4), labels = mapping_otherstudy_checkbox_adm___4)

mapping_otherstudy_checkbox_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___5.factor = factor(data$otherstudy_checkbox_adm___5, levels = names(mapping_otherstudy_checkbox_adm___5), labels = mapping_otherstudy_checkbox_adm___5)

mapping_otherstudy_checkbox_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___6.factor = factor(data$otherstudy_checkbox_adm___6, levels = names(mapping_otherstudy_checkbox_adm___6), labels = mapping_otherstudy_checkbox_adm___6)

mapping_otherstudy_checkbox_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___7.factor = factor(data$otherstudy_checkbox_adm___7, levels = names(mapping_otherstudy_checkbox_adm___7), labels = mapping_otherstudy_checkbox_adm___7)

mapping_otherstudy_checkbox_adm___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___8.factor = factor(data$otherstudy_checkbox_adm___8, levels = names(mapping_otherstudy_checkbox_adm___8), labels = mapping_otherstudy_checkbox_adm___8)

mapping_otherstudy_checkbox_adm___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___9.factor = factor(data$otherstudy_checkbox_adm___9, levels = names(mapping_otherstudy_checkbox_adm___9), labels = mapping_otherstudy_checkbox_adm___9)

mapping_otherstudy_checkbox_adm___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_checkbox_adm___98.factor = factor(data$otherstudy_checkbox_adm___98, levels = names(mapping_otherstudy_checkbox_adm___98), labels = mapping_otherstudy_checkbox_adm___98)

mapping_patient_details_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$patient_details_complete.factor = factor(data$patient_details_complete, levels = names(mapping_patient_details_complete), labels = mapping_patient_details_complete)

mapping_consent_version = c(
	"3" = "Version 3, October 25 2023",
	"4" = "Version 4, February 9 2024",
	"5" = "Version 5, January 15 2025",
	"21" = "Version 1, November 29 2023",
	"31" = "Version 1, December 11 2023"
)
data$consent_version.factor = factor(data$consent_version, levels = names(mapping_consent_version), labels = mapping_consent_version)

mapping_consent_storage_version = c(
	"1" = "Version 1, February 9, 2024"
)
data$consent_storage_version.factor = factor(data$consent_storage_version, levels = names(mapping_consent_storage_version), labels = mapping_consent_storage_version)

mapping_consent_language = c(
	"1" = "English",
	"2" = "Runyankore",
	"3" = "Luganda",
	"4" = "Lusoga",
	"5" = "Kinyarwanda",
	"6" = "Kiswahili"
)
data$consent_language.factor = factor(data$consent_language, levels = names(mapping_consent_language), labels = mapping_consent_language)

mapping_consent_form_type = c(
	"1" = "Adult caregivers",
	"2" = "Caregivers under 18 years of age",
	"3" = "Caregivers under 21 years of age"
)
data$consent_form_type.factor = factor(data$consent_form_type, levels = names(mapping_consent_form_type), labels = mapping_consent_form_type)

mapping_consent_future_research = c(
	"1" = "Yes",
	"0" = "No"
)
data$consent_future_research.factor = factor(data$consent_future_research, levels = names(mapping_consent_future_research), labels = mapping_consent_future_research)

mapping_consent_partcg_consent = c(
	"1" = "Yes, I consent to participate",
	"0" = "No, I do not consent to participate"
)
data$consent_partcg_consent.factor = factor(data$consent_partcg_consent, levels = names(mapping_consent_partcg_consent), labels = mapping_consent_partcg_consent)

mapping_consent_partcg_consent_2 = c(
	"1" = "Ego, ninyikiriza kwejumba omukucondooza",
	"0" = "Ngaha, tindikwikiriza kwejumba omukucondooza"
)
data$consent_partcg_consent_2.factor = factor(data$consent_partcg_consent_2, levels = names(mapping_consent_partcg_consent_2), labels = mapping_consent_partcg_consent_2)

mapping_consent_partcg_consent_3 = c(
	"1" = "Ye, nzikirizza okwetaba mu musomo",
	"0" = "Nedda, ssikirizza kwetaba mu musomo"
)
data$consent_partcg_consent_3.factor = factor(data$consent_partcg_consent_3, levels = names(mapping_consent_partcg_consent_3), labels = mapping_consent_partcg_consent_3)

mapping_consent_partcg_consent_4 = c(
	"1" = "Ndikiriza okwegaitamukunonyeleza.",
	"0" = "Ndhobye okwegaitamukunonyeleza."
)
data$consent_partcg_consent_4.factor = factor(data$consent_partcg_consent_4, levels = names(mapping_consent_partcg_consent_4), labels = mapping_consent_partcg_consent_4)

mapping_consent_partcg_consent_5 = c(
	"1" = "Yego, nemeye kwitabira",
	"0" = "Oya, Simbyemeye kwitabira"
)
data$consent_partcg_consent_5.factor = factor(data$consent_partcg_consent_5, levels = names(mapping_consent_partcg_consent_5), labels = mapping_consent_partcg_consent_5)

mapping_consent_partcg_consent_6 = c(
	"1" = "Ndiyo, nimekubali kushiriki",
	"0" = "Hapana, sikubali kushiriki"
)
data$consent_partcg_consent_6.factor = factor(data$consent_partcg_consent_6, levels = names(mapping_consent_partcg_consent_6), labels = mapping_consent_partcg_consent_6)

mapping_consent_consent = c(
	"1" = "Yes, I consent to participate",
	"0" = "No, I do not consent to participate"
)
data$consent_consent.factor = factor(data$consent_consent, levels = names(mapping_consent_consent), labels = mapping_consent_consent)

mapping_consent_consent_2 = c(
	"1" = "Ego, ninyikiriza kwejumba omukucondooza",
	"0" = "Ngaha, tindikwikiriza kwejumba omukucondooza"
)
data$consent_consent_2.factor = factor(data$consent_consent_2, levels = names(mapping_consent_consent_2), labels = mapping_consent_consent_2)

mapping_consent_consent_3 = c(
	"1" = "Ye, nzikirizza okwetaba mu musomo",
	"0" = "Nedda, ssikirizza kwetaba mu musomo"
)
data$consent_consent_3.factor = factor(data$consent_consent_3, levels = names(mapping_consent_consent_3), labels = mapping_consent_consent_3)

mapping_consent_consent_4 = c(
	"1" = "Ndikiriza okwegaitamukunonyeleza.",
	"0" = "Ndhobye okwegaitamukunonyeleza."
)
data$consent_consent_4.factor = factor(data$consent_consent_4, levels = names(mapping_consent_consent_4), labels = mapping_consent_consent_4)

mapping_consent_consent_5 = c(
	"1" = "Yego, nemeye kwitabira",
	"0" = "Oya, Simbyemeye kwitabira"
)
data$consent_consent_5.factor = factor(data$consent_consent_5, levels = names(mapping_consent_consent_5), labels = mapping_consent_consent_5)

mapping_consent_consent_6 = c(
	"1" = "Ndiyo, nimekubali kushiriki",
	"0" = "Hapana, sikubali kushiriki"
)
data$consent_consent_6.factor = factor(data$consent_consent_6, levels = names(mapping_consent_consent_6), labels = mapping_consent_consent_6)

mapping_consent_storage = c(
	"1" = "I accept that the research materials obtained from my child as a research participant be stored confidentially for future use",
	"0" = "I do not accept that the research materials obtained from my child as a research participant be stored confidentially for future use"
)
data$consent_storage.factor = factor(data$consent_storage, levels = names(mapping_consent_storage), labels = mapping_consent_storage)

mapping_consent_storage_2 = c(
	"1" = "Nyowe naikiriza enkari yomwaana wangye ebiikwa omukihama Kwenda kukozesibwa omubwiire bwomumaisho",
	"0" = "Nyowe tinaikiriza ku enkari yomwaana wangye ebiikwa omukihama Kwenda kukozesibwa omubwiire bwomumaisho"
)
data$consent_storage_2.factor = factor(data$consent_storage_2, levels = names(mapping_consent_storage_2), labels = mapping_consent_storage_2)

mapping_consent_storage_3 = c(
	"1" = "Nze nzikiriza omusulo gwebatodde kumwana wange ali mukunonyereza kuno okuterekebwa mukyama era okozesebwa mumaso",
	"0" = "Nze nganye nti omusolo gwebatodde kumwana wange ali mukunonyereza kuno okuterekebwa mukyama era okozesebwa mumaso"
)
data$consent_storage_3.factor = factor(data$consent_storage_3, levels = names(mapping_consent_storage_3), labels = mapping_consent_storage_3)

mapping_consent_storage_4 = c(
	"1" = "Nze ndikiriza amaihe gebatoile kumwanha wange ali mukunonenkereza kuno okuterekebwa mukyama ero nokukozesebwa mumaiso",
	"0" = "Nze ndhobye nti amaihe gebatoile kumwanha wange ali mukunonenkereza kuno okuterekebwa mukyama ero nokukozesebwa mumaiso"
)
data$consent_storage_4.factor = factor(data$consent_storage_4, levels = names(mapping_consent_storage_4), labels = mapping_consent_storage_4)

mapping_consent_participant_age = c(
	"1" = "Yes",
	"0" = "No"
)
data$consent_participant_age.factor = factor(data$consent_participant_age, levels = names(mapping_consent_participant_age), labels = mapping_consent_participant_age)

mapping_consent_assent = c(
	"1" = "Yes",
	"0" = "No (Child is ineligible to participate)",
	"2" = "Delayed assent",
	"5" = "Waiver of assent - child incompetent to provide assent",
	"3" = "Waiver of assent - child died in hospital",
	"4" = "Waiver of assent - child died post-discharge"
)
data$consent_assent.factor = factor(data$consent_assent, levels = names(mapping_consent_assent), labels = mapping_consent_assent)

mapping_consent_participant_age2 = c(
	"1" = "Yes",
	"0" = "No"
)
data$consent_participant_age2.factor = factor(data$consent_participant_age2, levels = names(mapping_consent_participant_age2), labels = mapping_consent_participant_age2)

mapping_consent_participant_age3 = c(
	"1" = "Yes",
	"0" = "No"
)
data$consent_participant_age3.factor = factor(data$consent_participant_age3, levels = names(mapping_consent_participant_age3), labels = mapping_consent_participant_age3)

mapping_consent_assent_version = c(
	"22" = "Version 2, February 28 2024",
	"31" = "Version 1, December 11 2023"
)
data$consent_assent_version.factor = factor(data$consent_assent_version, levels = names(mapping_consent_assent_version), labels = mapping_consent_assent_version)

mapping_consent_assent_written = c(
	"1" = "Yes",
	"0" = "No (Child is ineligible to participate)",
	"2" = "Delayed assent",
	"5" = "Waiver of assent - child incompetent to provide assent",
	"3" = "Waiver of assent - child died in hospital",
	"4" = "Waiver of assent - child died post-discharge"
)
data$consent_assent_written.factor = factor(data$consent_assent_written, levels = names(mapping_consent_assent_written), labels = mapping_consent_assent_written)

mapping_consent_witness_confirm = c(
	"1" = "Yes, I confirm to have witnessed the participant providing e-consent for the clinical study",
	"99" = "Not applicable"
)
data$consent_witness_confirm.factor = factor(data$consent_witness_confirm, levels = names(mapping_consent_witness_confirm), labels = mapping_consent_witness_confirm)

mapping_consent_witness_storage = c(
	"1" = "Yes, I confirm to have witnessed the participant providing e-consent for biological sample storage",
	"99" = "Not applicable"
)
data$consent_witness_storage.factor = factor(data$consent_witness_storage, levels = names(mapping_consent_witness_storage), labels = mapping_consent_witness_storage)

mapping_consent_studystaff_confirm = c(
	"1" = "Yes, I confirm that I have obtained e-consent from the participant for the clinical study"
)
data$consent_studystaff_confirm.factor = factor(data$consent_studystaff_confirm, levels = names(mapping_consent_studystaff_confirm), labels = mapping_consent_studystaff_confirm)

mapping_consent_studystaff_storage = c(
	"1" = "Yes, I confirm that I have obtained e-consent from the participant for biological sample storage"
)
data$consent_studystaff_storage.factor = factor(data$consent_studystaff_storage, levels = names(mapping_consent_studystaff_storage), labels = mapping_consent_studystaff_storage)

mapping_consent_form_storage_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$consent_form_storage_complete.factor = factor(data$consent_form_storage_complete, levels = names(mapping_consent_form_storage_complete), labels = mapping_consent_form_storage_complete)

mapping_maternalsubstance_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$maternalsubstance_adm___1.factor = factor(data$maternalsubstance_adm___1, levels = names(mapping_maternalsubstance_adm___1), labels = mapping_maternalsubstance_adm___1)

mapping_maternalsubstance_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$maternalsubstance_adm___2.factor = factor(data$maternalsubstance_adm___2, levels = names(mapping_maternalsubstance_adm___2), labels = mapping_maternalsubstance_adm___2)

mapping_maternalsubstance_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$maternalsubstance_adm___3.factor = factor(data$maternalsubstance_adm___3, levels = names(mapping_maternalsubstance_adm___3), labels = mapping_maternalsubstance_adm___3)

mapping_maternalsubstance_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$maternalsubstance_adm___4.factor = factor(data$maternalsubstance_adm___4, levels = names(mapping_maternalsubstance_adm___4), labels = mapping_maternalsubstance_adm___4)

mapping_maternalsubstance_adm___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$maternalsubstance_adm___96.factor = factor(data$maternalsubstance_adm___96, levels = names(mapping_maternalsubstance_adm___96), labels = mapping_maternalsubstance_adm___96)

mapping_maternalsubstance_adm___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$maternalsubstance_adm___97.factor = factor(data$maternalsubstance_adm___97, levels = names(mapping_maternalsubstance_adm___97), labels = mapping_maternalsubstance_adm___97)

mapping_vsampm_adm = c(
	"1" = "AM",
	"2" = "PM"
)
data$vsampm_adm.factor = factor(data$vsampm_adm, levels = names(mapping_vsampm_adm), labels = mapping_vsampm_adm)

mapping_spo2onoxy_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$spo2onoxy_adm.factor = factor(data$spo2onoxy_adm, levels = names(mapping_spo2onoxy_adm), labels = mapping_spo2onoxy_adm)

mapping_oxygenavail_adm = c(
	"1" = "Oxygen available and being used",
	"2" = "Oxygen available and not being used",
	"3" = "Oxygen not available",
	"4" = "Oxygen available but not enough",
	"97" = "Unsure of oxygen availability"
)
data$oxygenavail_adm.factor = factor(data$oxygenavail_adm, levels = names(mapping_oxygenavail_adm), labels = mapping_oxygenavail_adm)

mapping_respdistress_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$respdistress_adm.factor = factor(data$respdistress_adm, levels = names(mapping_respdistress_adm), labels = mapping_respdistress_adm)

mapping_caprefill_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$caprefill_adm.factor = factor(data$caprefill_adm, levels = names(mapping_caprefill_adm), labels = mapping_caprefill_adm)

mapping_bcseye_adm = c(
	"0" = "Fails to watch or follow",
	"1" = "Watches or follows"
)
data$bcseye_adm.factor = factor(data$bcseye_adm, levels = names(mapping_bcseye_adm), labels = mapping_bcseye_adm)

mapping_bcsmotor_adm = c(
	"0" = "No response or inappropriate response",
	"1" = "Withdraws limb from painful stimulus",
	"2" = "Localizes painful stimulus"
)
data$bcsmotor_adm.factor = factor(data$bcsmotor_adm, levels = names(mapping_bcsmotor_adm), labels = mapping_bcsmotor_adm)

mapping_bcsverbal_adm = c(
	"0" = "No vocal response to pain",
	"1" = "Moan or abnormal cry with pain",
	"2" = "Cries appropriately with pain, or, if verbal, speaks"
)
data$bcsverbal_adm.factor = factor(data$bcsverbal_adm, levels = names(mapping_bcsverbal_adm), labels = mapping_bcsverbal_adm)

mapping_prostration_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$prostration_adm.factor = factor(data$prostration_adm, levels = names(mapping_prostration_adm), labels = mapping_prostration_adm)

mapping_admitabx_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___1.factor = factor(data$admitabx_adm___1, levels = names(mapping_admitabx_adm___1), labels = mapping_admitabx_adm___1)

mapping_admitabx_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___2.factor = factor(data$admitabx_adm___2, levels = names(mapping_admitabx_adm___2), labels = mapping_admitabx_adm___2)

mapping_admitabx_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___3.factor = factor(data$admitabx_adm___3, levels = names(mapping_admitabx_adm___3), labels = mapping_admitabx_adm___3)

mapping_admitabx_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___4.factor = factor(data$admitabx_adm___4, levels = names(mapping_admitabx_adm___4), labels = mapping_admitabx_adm___4)

mapping_admitabx_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___5.factor = factor(data$admitabx_adm___5, levels = names(mapping_admitabx_adm___5), labels = mapping_admitabx_adm___5)

mapping_admitabx_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___6.factor = factor(data$admitabx_adm___6, levels = names(mapping_admitabx_adm___6), labels = mapping_admitabx_adm___6)

mapping_admitabx_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___7.factor = factor(data$admitabx_adm___7, levels = names(mapping_admitabx_adm___7), labels = mapping_admitabx_adm___7)

mapping_admitabx_adm___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___8.factor = factor(data$admitabx_adm___8, levels = names(mapping_admitabx_adm___8), labels = mapping_admitabx_adm___8)

mapping_admitabx_adm___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___9.factor = factor(data$admitabx_adm___9, levels = names(mapping_admitabx_adm___9), labels = mapping_admitabx_adm___9)

mapping_admitabx_adm___10 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___10.factor = factor(data$admitabx_adm___10, levels = names(mapping_admitabx_adm___10), labels = mapping_admitabx_adm___10)

mapping_admitabx_adm___11 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___11.factor = factor(data$admitabx_adm___11, levels = names(mapping_admitabx_adm___11), labels = mapping_admitabx_adm___11)

mapping_admitabx_adm___12 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___12.factor = factor(data$admitabx_adm___12, levels = names(mapping_admitabx_adm___12), labels = mapping_admitabx_adm___12)

mapping_admitabx_adm___13 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___13.factor = factor(data$admitabx_adm___13, levels = names(mapping_admitabx_adm___13), labels = mapping_admitabx_adm___13)

mapping_admitabx_adm___14 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___14.factor = factor(data$admitabx_adm___14, levels = names(mapping_admitabx_adm___14), labels = mapping_admitabx_adm___14)

mapping_admitabx_adm___15 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___15.factor = factor(data$admitabx_adm___15, levels = names(mapping_admitabx_adm___15), labels = mapping_admitabx_adm___15)

mapping_admitabx_adm___16 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___16.factor = factor(data$admitabx_adm___16, levels = names(mapping_admitabx_adm___16), labels = mapping_admitabx_adm___16)

mapping_admitabx_adm___17 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___17.factor = factor(data$admitabx_adm___17, levels = names(mapping_admitabx_adm___17), labels = mapping_admitabx_adm___17)

mapping_admitabx_adm___18 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___18.factor = factor(data$admitabx_adm___18, levels = names(mapping_admitabx_adm___18), labels = mapping_admitabx_adm___18)

mapping_admitabx_adm___19 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___19.factor = factor(data$admitabx_adm___19, levels = names(mapping_admitabx_adm___19), labels = mapping_admitabx_adm___19)

mapping_admitabx_adm___22 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___22.factor = factor(data$admitabx_adm___22, levels = names(mapping_admitabx_adm___22), labels = mapping_admitabx_adm___22)

mapping_admitabx_adm___23 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___23.factor = factor(data$admitabx_adm___23, levels = names(mapping_admitabx_adm___23), labels = mapping_admitabx_adm___23)

mapping_admitabx_adm___24 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___24.factor = factor(data$admitabx_adm___24, levels = names(mapping_admitabx_adm___24), labels = mapping_admitabx_adm___24)

mapping_admitabx_adm___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___98.factor = factor(data$admitabx_adm___98, levels = names(mapping_admitabx_adm___98), labels = mapping_admitabx_adm___98)

mapping_admitabx_adm___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$admitabx_adm___96.factor = factor(data$admitabx_adm___96, levels = names(mapping_admitabx_adm___96), labels = mapping_admitabx_adm___96)

mapping_bcgscar_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$bcgscar_adm.factor = factor(data$bcgscar_adm, levels = names(mapping_bcgscar_adm), labels = mapping_bcgscar_adm)

mapping_vaccmeasles_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Unknown"
)
data$vaccmeasles_adm.factor = factor(data$vaccmeasles_adm, levels = names(mapping_vaccmeasles_adm), labels = mapping_vaccmeasles_adm)

mapping_vaccmeaslessource_adm = c(
	"1" = "Self report",
	"2" = "Card"
)
data$vaccmeaslessource_adm.factor = factor(data$vaccmeaslessource_adm, levels = names(mapping_vaccmeaslessource_adm), labels = mapping_vaccmeaslessource_adm)

mapping_vaccpneumoc_adm = c(
	"1" = "0 doses",
	"2" = "1 dose",
	"3" = "2 doses",
	"4" = "3 doses",
	"97" = "Unknown"
)
data$vaccpneumoc_adm.factor = factor(data$vaccpneumoc_adm, levels = names(mapping_vaccpneumoc_adm), labels = mapping_vaccpneumoc_adm)

mapping_vaccpneumocsource_adm = c(
	"1" = "Self report",
	"2" = "Card"
)
data$vaccpneumocsource_adm.factor = factor(data$vaccpneumocsource_adm, levels = names(mapping_vaccpneumocsource_adm), labels = mapping_vaccpneumocsource_adm)

mapping_vaccdpt_adm = c(
	"1" = "0 doses",
	"2" = "1 dose",
	"3" = "2 doses",
	"4" = "3 doses",
	"97" = "Unknown"
)
data$vaccdpt_adm.factor = factor(data$vaccdpt_adm, levels = names(mapping_vaccdpt_adm), labels = mapping_vaccdpt_adm)

mapping_vaccdptsource_adm = c(
	"1" = "Self report",
	"2" = "Card"
)
data$vaccdptsource_adm.factor = factor(data$vaccdptsource_adm, levels = names(mapping_vaccdptsource_adm), labels = mapping_vaccdptsource_adm)

mapping_priorweekabx_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$priorweekabx_adm.factor = factor(data$priorweekabx_adm, levels = names(mapping_priorweekabx_adm), labels = mapping_priorweekabx_adm)

mapping_priorweekantimal_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$priorweekantimal_adm.factor = factor(data$priorweekantimal_adm, levels = names(mapping_priorweekantimal_adm), labels = mapping_priorweekantimal_adm)

mapping_symptoms_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___1.factor = factor(data$symptoms_adm___1, levels = names(mapping_symptoms_adm___1), labels = mapping_symptoms_adm___1)

mapping_symptoms_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___2.factor = factor(data$symptoms_adm___2, levels = names(mapping_symptoms_adm___2), labels = mapping_symptoms_adm___2)

mapping_symptoms_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___3.factor = factor(data$symptoms_adm___3, levels = names(mapping_symptoms_adm___3), labels = mapping_symptoms_adm___3)

mapping_symptoms_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___4.factor = factor(data$symptoms_adm___4, levels = names(mapping_symptoms_adm___4), labels = mapping_symptoms_adm___4)

mapping_symptoms_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___5.factor = factor(data$symptoms_adm___5, levels = names(mapping_symptoms_adm___5), labels = mapping_symptoms_adm___5)

mapping_symptoms_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___6.factor = factor(data$symptoms_adm___6, levels = names(mapping_symptoms_adm___6), labels = mapping_symptoms_adm___6)

mapping_symptoms_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___7.factor = factor(data$symptoms_adm___7, levels = names(mapping_symptoms_adm___7), labels = mapping_symptoms_adm___7)

mapping_symptoms_adm___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___8.factor = factor(data$symptoms_adm___8, levels = names(mapping_symptoms_adm___8), labels = mapping_symptoms_adm___8)

mapping_symptoms_adm___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___9.factor = factor(data$symptoms_adm___9, levels = names(mapping_symptoms_adm___9), labels = mapping_symptoms_adm___9)

mapping_symptoms_adm___10 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___10.factor = factor(data$symptoms_adm___10, levels = names(mapping_symptoms_adm___10), labels = mapping_symptoms_adm___10)

mapping_symptoms_adm___11 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___11.factor = factor(data$symptoms_adm___11, levels = names(mapping_symptoms_adm___11), labels = mapping_symptoms_adm___11)

mapping_symptoms_adm___12 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___12.factor = factor(data$symptoms_adm___12, levels = names(mapping_symptoms_adm___12), labels = mapping_symptoms_adm___12)

mapping_symptoms_adm___13 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___13.factor = factor(data$symptoms_adm___13, levels = names(mapping_symptoms_adm___13), labels = mapping_symptoms_adm___13)

mapping_symptoms_adm___14 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___14.factor = factor(data$symptoms_adm___14, levels = names(mapping_symptoms_adm___14), labels = mapping_symptoms_adm___14)

mapping_symptoms_adm___15 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___15.factor = factor(data$symptoms_adm___15, levels = names(mapping_symptoms_adm___15), labels = mapping_symptoms_adm___15)

mapping_symptoms_adm___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___96.factor = factor(data$symptoms_adm___96, levels = names(mapping_symptoms_adm___96), labels = mapping_symptoms_adm___96)

mapping_symptoms_adm___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$symptoms_adm___97.factor = factor(data$symptoms_adm___97, levels = names(mapping_symptoms_adm___97), labels = mapping_symptoms_adm___97)

mapping_urine_adm = c(
	"1" = "Normal",
	"2" = "Decreased",
	"97" = "Dont know"
)
data$urine_adm.factor = factor(data$urine_adm, levels = names(mapping_urine_adm), labels = mapping_urine_adm)

mapping_urinesymp_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$urinesymp_adm.factor = factor(data$urinesymp_adm, levels = names(mapping_urinesymp_adm), labels = mapping_urinesymp_adm)

mapping_urinecolor_adm = c(
	"1" = "Deep yellow (concentrated)",
	"2" = "Bloody",
	"3" = "Tea colored"
)
data$urinecolor_adm.factor = factor(data$urinecolor_adm, levels = names(mapping_urinecolor_adm), labels = mapping_urinecolor_adm)

mapping_teaprobtime_adm = c(
	"1" = "Less than 48 hours",
	"2" = "48 hours to < 7 days",
	"3" = "7 days to < 1 month",
	"4" = "1 month or more",
	"97" = "Dont know"
)
data$teaprobtime_adm.factor = factor(data$teaprobtime_adm, levels = names(mapping_teaprobtime_adm), labels = mapping_teaprobtime_adm)

mapping_teareptepi_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$teareptepi_adm.factor = factor(data$teareptepi_adm, levels = names(mapping_teareptepi_adm), labels = mapping_teareptepi_adm)

mapping_urinepain_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$urinepain_adm.factor = factor(data$urinepain_adm, levels = names(mapping_urinepain_adm), labels = mapping_urinepain_adm)

mapping_urinepaintime_adm = c(
	"1" = "Less than 48 hours",
	"2" = "48 hours to < 7 days",
	"3" = "7 days to < 1 month",
	"4" = "1 month or more",
	"97" = "Dont know"
)
data$urinepaintime_adm.factor = factor(data$urinepaintime_adm, levels = names(mapping_urinepaintime_adm), labels = mapping_urinepaintime_adm)

mapping_bloodtransfuse_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$bloodtransfuse_adm.factor = factor(data$bloodtransfuse_adm, levels = names(mapping_bloodtransfuse_adm), labels = mapping_bloodtransfuse_adm)

mapping_transfustimes_adm = c(
	"1" = "1 time",
	"2" = "2 - 5 times",
	"3" = "6 - 10 times",
	"4" = "More than 10 times",
	"97" = "Dont know"
)
data$transfustimes_adm.factor = factor(data$transfustimes_adm, levels = names(mapping_transfustimes_adm), labels = mapping_transfustimes_adm)

mapping_kidneydis_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$kidneydis_adm.factor = factor(data$kidneydis_adm, levels = names(mapping_kidneydis_adm), labels = mapping_kidneydis_adm)

mapping_swelling_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$swelling_adm.factor = factor(data$swelling_adm, levels = names(mapping_swelling_adm), labels = mapping_swelling_adm)

mapping_swellinglocation_adm = c(
	"1" = "Face (around the eyes)",
	"2" = "Feet/legs/ankles",
	"3" = "Whole body",
	"97" = "Dont know",
	"98" = "Other"
)
data$swellinglocation_adm.factor = factor(data$swellinglocation_adm, levels = names(mapping_swellinglocation_adm), labels = mapping_swellinglocation_adm)

mapping_swellingtime_adm = c(
	"1" = "Less than 48 hours",
	"2" = "48 hours to < 7 days",
	"3" = "7 days to < 1 month",
	"4" = "1 month or more",
	"97" = "Dont know"
)
data$swellingtime_adm.factor = factor(data$swellingtime_adm, levels = names(mapping_swellingtime_adm), labels = mapping_swellingtime_adm)

mapping_pallorcojunc_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$pallorcojunc_adm.factor = factor(data$pallorcojunc_adm, levels = names(mapping_pallorcojunc_adm), labels = mapping_pallorcojunc_adm)

mapping_jaundice_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$jaundice_adm.factor = factor(data$jaundice_adm, levels = names(mapping_jaundice_adm), labels = mapping_jaundice_adm)

mapping_sucking_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know",
	"99" = "Not Applicable"
)
data$sucking_adm.factor = factor(data$sucking_adm, levels = names(mapping_sucking_adm), labels = mapping_sucking_adm)

mapping_sucking_onbf_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know",
	"99" = "Not Applicable"
)
data$sucking_onbf_adm.factor = factor(data$sucking_onbf_adm, levels = names(mapping_sucking_onbf_adm), labels = mapping_sucking_onbf_adm)

mapping_tone_adm = c(
	"1" = "Increased (stiff)",
	"2" = "Normal",
	"3" = "Decreased (floppy)",
	"97" = "Dont know"
)
data$tone_adm.factor = factor(data$tone_adm, levels = names(mapping_tone_adm), labels = mapping_tone_adm)

mapping_dpi_adm = c(
	"1" = "< 48hrs",
	"2" = "48hrs - 7d",
	"3" = ">7d - 1mo",
	"4" = ">1mo",
	"97" = "Dont know"
)
data$dpi_adm.factor = factor(data$dpi_adm, levels = names(mapping_dpi_adm), labels = mapping_dpi_adm)

mapping_fontanelle_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$fontanelle_adm.factor = factor(data$fontanelle_adm, levels = names(mapping_fontanelle_adm), labels = mapping_fontanelle_adm)

mapping_dehydration_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$dehydration_adm.factor = factor(data$dehydration_adm, levels = names(mapping_dehydration_adm), labels = mapping_dehydration_adm)

mapping_dehydrationappearance_adm = c(
	"1" = "Well, alert",
	"2" = "Restless, irritable",
	"3" = "Lethargic or unconscious"
)
data$dehydrationappearance_adm.factor = factor(data$dehydrationappearance_adm, levels = names(mapping_dehydrationappearance_adm), labels = mapping_dehydrationappearance_adm)

mapping_dehydrationeyes_adm = c(
	"1" = "Normal",
	"2" = "Sunken"
)
data$dehydrationeyes_adm.factor = factor(data$dehydrationeyes_adm, levels = names(mapping_dehydrationeyes_adm), labels = mapping_dehydrationeyes_adm)

mapping_dehydrationthirst_adm = c(
	"1" = "Drinks normally, not thirsty",
	"2" = "Thirsty, drinks eagerly",
	"3" = "Drinks poorly, or not able to drink"
)
data$dehydrationthirst_adm.factor = factor(data$dehydrationthirst_adm, levels = names(mapping_dehydrationthirst_adm), labels = mapping_dehydrationthirst_adm)

mapping_dehydrationturgor_adm = c(
	"1" = "Goes back quickly",
	"2" = "Goes back slowly",
	"3" = "Goes back very slowly"
)
data$dehydrationturgor_adm.factor = factor(data$dehydrationturgor_adm, levels = names(mapping_dehydrationturgor_adm), labels = mapping_dehydrationturgor_adm)

mapping_abdomen_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$abdomen_adm.factor = factor(data$abdomen_adm, levels = names(mapping_abdomen_adm), labels = mapping_abdomen_adm)

mapping_hivquestions_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$hivquestions_adm___1.factor = factor(data$hivquestions_adm___1, levels = names(mapping_hivquestions_adm___1), labels = mapping_hivquestions_adm___1)

mapping_hivquestions_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$hivquestions_adm___2.factor = factor(data$hivquestions_adm___2, levels = names(mapping_hivquestions_adm___2), labels = mapping_hivquestions_adm___2)

mapping_hivquestions_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$hivquestions_adm___3.factor = factor(data$hivquestions_adm___3, levels = names(mapping_hivquestions_adm___3), labels = mapping_hivquestions_adm___3)

mapping_hivquestions_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$hivquestions_adm___4.factor = factor(data$hivquestions_adm___4, levels = names(mapping_hivquestions_adm___4), labels = mapping_hivquestions_adm___4)

mapping_hivquestions_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$hivquestions_adm___5.factor = factor(data$hivquestions_adm___5, levels = names(mapping_hivquestions_adm___5), labels = mapping_hivquestions_adm___5)

mapping_hivquestions_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$hivquestions_adm___6.factor = factor(data$hivquestions_adm___6, levels = names(mapping_hivquestions_adm___6), labels = mapping_hivquestions_adm___6)

mapping_hivquestions_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$hivquestions_adm___7.factor = factor(data$hivquestions_adm___7, levels = names(mapping_hivquestions_adm___7), labels = mapping_hivquestions_adm___7)

mapping_hivpcr_adm = c(
	"1" = "PCR positive",
	"2" = "PCR negative",
	"3" = "PCR not done",
	"97" = "Dont know",
	"99" = "Not applicable"
)
data$hivpcr_adm.factor = factor(data$hivpcr_adm, levels = names(mapping_hivpcr_adm), labels = mapping_hivpcr_adm)

mapping_gestationalage_adm = c(
	"1" = "Premature",
	"2" = "Term birth",
	"97" = "Dont know"
)
data$gestationalage_adm.factor = factor(data$gestationalage_adm, levels = names(mapping_gestationalage_adm), labels = mapping_gestationalage_adm)

mapping_premature_adm = c(
	"1" = "< 7 months",
	"2" = "7 - 8 months",
	"3" = ">8 months"
)
data$premature_adm.factor = factor(data$premature_adm, levels = names(mapping_premature_adm), labels = mapping_premature_adm)

mapping_anv_adm = c(
	"0" = "None",
	"1" = "1",
	"2" = "2",
	"3" = "3",
	"4" = "4",
	"5" = ">4",
	"97" = "Dont know"
)
data$anv_adm.factor = factor(data$anv_adm, levels = names(mapping_anv_adm), labels = mapping_anv_adm)

mapping_birthcry_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$birthcry_adm.factor = factor(data$birthcry_adm, levels = names(mapping_birthcry_adm), labels = mapping_birthcry_adm)

mapping_timecry_adm = c(
	"1" = "< 5min",
	"2" = "5 to 10min",
	"3" = ">10min - 30min",
	"4" = ">30min"
)
data$timecry_adm.factor = factor(data$timecry_adm, levels = names(mapping_timecry_adm), labels = mapping_timecry_adm)

mapping_birthresuscitation_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___1.factor = factor(data$birthresuscitation_adm___1, levels = names(mapping_birthresuscitation_adm___1), labels = mapping_birthresuscitation_adm___1)

mapping_birthresuscitation_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___2.factor = factor(data$birthresuscitation_adm___2, levels = names(mapping_birthresuscitation_adm___2), labels = mapping_birthresuscitation_adm___2)

mapping_birthresuscitation_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___3.factor = factor(data$birthresuscitation_adm___3, levels = names(mapping_birthresuscitation_adm___3), labels = mapping_birthresuscitation_adm___3)

mapping_birthresuscitation_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___4.factor = factor(data$birthresuscitation_adm___4, levels = names(mapping_birthresuscitation_adm___4), labels = mapping_birthresuscitation_adm___4)

mapping_birthresuscitation_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___5.factor = factor(data$birthresuscitation_adm___5, levels = names(mapping_birthresuscitation_adm___5), labels = mapping_birthresuscitation_adm___5)

mapping_birthresuscitation_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___6.factor = factor(data$birthresuscitation_adm___6, levels = names(mapping_birthresuscitation_adm___6), labels = mapping_birthresuscitation_adm___6)

mapping_birthresuscitation_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___7.factor = factor(data$birthresuscitation_adm___7, levels = names(mapping_birthresuscitation_adm___7), labels = mapping_birthresuscitation_adm___7)

mapping_birthresuscitation_adm___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___97.factor = factor(data$birthresuscitation_adm___97, levels = names(mapping_birthresuscitation_adm___97), labels = mapping_birthresuscitation_adm___97)

mapping_birthresuscitation_adm___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthresuscitation_adm___98.factor = factor(data$birthresuscitation_adm___98, levels = names(mapping_birthresuscitation_adm___98), labels = mapping_birthresuscitation_adm___98)

mapping_deliverytype_adm = c(
	"1" = "Spontaneous vaginal",
	"2" = "Caesarian",
	"3" = "Assisted delivery (vacuum, forceps, etc.)",
	"97" = "Unknown"
)
data$deliverytype_adm.factor = factor(data$deliverytype_adm, levels = names(mapping_deliverytype_adm), labels = mapping_deliverytype_adm)

mapping_cordcare_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___1.factor = factor(data$cordcare_adm___1, levels = names(mapping_cordcare_adm___1), labels = mapping_cordcare_adm___1)

mapping_cordcare_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___2.factor = factor(data$cordcare_adm___2, levels = names(mapping_cordcare_adm___2), labels = mapping_cordcare_adm___2)

mapping_cordcare_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___3.factor = factor(data$cordcare_adm___3, levels = names(mapping_cordcare_adm___3), labels = mapping_cordcare_adm___3)

mapping_cordcare_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___4.factor = factor(data$cordcare_adm___4, levels = names(mapping_cordcare_adm___4), labels = mapping_cordcare_adm___4)

mapping_cordcare_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___5.factor = factor(data$cordcare_adm___5, levels = names(mapping_cordcare_adm___5), labels = mapping_cordcare_adm___5)

mapping_cordcare_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___6.factor = factor(data$cordcare_adm___6, levels = names(mapping_cordcare_adm___6), labels = mapping_cordcare_adm___6)

mapping_cordcare_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___7.factor = factor(data$cordcare_adm___7, levels = names(mapping_cordcare_adm___7), labels = mapping_cordcare_adm___7)

mapping_cordcare_adm___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___8.factor = factor(data$cordcare_adm___8, levels = names(mapping_cordcare_adm___8), labels = mapping_cordcare_adm___8)

mapping_cordcare_adm___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___9.factor = factor(data$cordcare_adm___9, levels = names(mapping_cordcare_adm___9), labels = mapping_cordcare_adm___9)

mapping_cordcare_adm___0 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cordcare_adm___0.factor = factor(data$cordcare_adm___0, levels = names(mapping_cordcare_adm___0), labels = mapping_cordcare_adm___0)

mapping_maternalacute_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$maternalacute_adm.factor = factor(data$maternalacute_adm, levels = names(mapping_maternalacute_adm), labels = mapping_maternalacute_adm)

mapping_maternalchronic_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$maternalchronic_adm.factor = factor(data$maternalchronic_adm, levels = names(mapping_maternalchronic_adm), labels = mapping_maternalchronic_adm)

mapping_comorbidity_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___1.factor = factor(data$comorbidity_adm___1, levels = names(mapping_comorbidity_adm___1), labels = mapping_comorbidity_adm___1)

mapping_comorbidity_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___2.factor = factor(data$comorbidity_adm___2, levels = names(mapping_comorbidity_adm___2), labels = mapping_comorbidity_adm___2)

mapping_comorbidity_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___3.factor = factor(data$comorbidity_adm___3, levels = names(mapping_comorbidity_adm___3), labels = mapping_comorbidity_adm___3)

mapping_comorbidity_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___4.factor = factor(data$comorbidity_adm___4, levels = names(mapping_comorbidity_adm___4), labels = mapping_comorbidity_adm___4)

mapping_comorbidity_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___5.factor = factor(data$comorbidity_adm___5, levels = names(mapping_comorbidity_adm___5), labels = mapping_comorbidity_adm___5)

mapping_comorbidity_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___6.factor = factor(data$comorbidity_adm___6, levels = names(mapping_comorbidity_adm___6), labels = mapping_comorbidity_adm___6)

mapping_comorbidity_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___7.factor = factor(data$comorbidity_adm___7, levels = names(mapping_comorbidity_adm___7), labels = mapping_comorbidity_adm___7)

mapping_comorbidity_adm___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___8.factor = factor(data$comorbidity_adm___8, levels = names(mapping_comorbidity_adm___8), labels = mapping_comorbidity_adm___8)

mapping_comorbidity_adm___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___9.factor = factor(data$comorbidity_adm___9, levels = names(mapping_comorbidity_adm___9), labels = mapping_comorbidity_adm___9)

mapping_comorbidity_adm___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___98.factor = factor(data$comorbidity_adm___98, levels = names(mapping_comorbidity_adm___98), labels = mapping_comorbidity_adm___98)

mapping_comorbidity_adm___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___96.factor = factor(data$comorbidity_adm___96, levels = names(mapping_comorbidity_adm___96), labels = mapping_comorbidity_adm___96)

mapping_comorbidity_adm___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$comorbidity_adm___97.factor = factor(data$comorbidity_adm___97, levels = names(mapping_comorbidity_adm___97), labels = mapping_comorbidity_adm___97)

mapping_priorhosp_adm = c(
	"1" = "< 7 days",
	"2" = "7 days to < 1 month",
	"3" = "1 month to < 6 months",
	"4" = "6 months to < 1 year",
	"5" = "1 year or more",
	"96" = "Never",
	"97" = "Dont know"
)
data$priorhosp_adm.factor = factor(data$priorhosp_adm, levels = names(mapping_priorhosp_adm), labels = mapping_priorhosp_adm)

mapping_priorhosp2_adm = c(
	"1" = "< 7 days",
	"2" = "7 days to < 1 month",
	"3" = "1 month to < 6 months",
	"4" = "6 months to < 1 year",
	"5" = "1 year or more",
	"96" = "Never",
	"97" = "Dont know"
)
data$priorhosp2_adm.factor = factor(data$priorhosp2_adm, levels = names(mapping_priorhosp2_adm), labels = mapping_priorhosp2_adm)

mapping_prioryearwheeze_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$prioryearwheeze_adm.factor = factor(data$prioryearwheeze_adm, levels = names(mapping_prioryearwheeze_adm), labels = mapping_prioryearwheeze_adm)

mapping_prioryearcough_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$prioryearcough_adm.factor = factor(data$prioryearcough_adm, levels = names(mapping_prioryearcough_adm), labels = mapping_prioryearcough_adm)

mapping_diarrheaoften_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$diarrheaoften_adm.factor = factor(data$diarrheaoften_adm, levels = names(mapping_diarrheaoften_adm), labels = mapping_diarrheaoften_adm)

mapping_tbcontact_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$tbcontact_adm.factor = factor(data$tbcontact_adm, levels = names(mapping_tbcontact_adm), labels = mapping_tbcontact_adm)

mapping_feedingstatus_adm = c(
	"1" = "Feeding well",
	"2" = "Feeding poorly",
	"3" = "Not feeding at all",
	"97" = "Dont know"
)
data$feedingstatus_adm.factor = factor(data$feedingstatus_adm, levels = names(mapping_feedingstatus_adm), labels = mapping_feedingstatus_adm)

mapping_feedingstatus_onliq_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know",
	"99" = "Not applicable"
)
data$feedingstatus_onliq_adm.factor = factor(data$feedingstatus_onliq_adm, levels = names(mapping_feedingstatus_onliq_adm), labels = mapping_feedingstatus_onliq_adm)

mapping_feedingstatus_onsolids_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know",
	"99" = "Not applicable"
)
data$feedingstatus_onsolids_adm.factor = factor(data$feedingstatus_onsolids_adm, levels = names(mapping_feedingstatus_onsolids_adm), labels = mapping_feedingstatus_onsolids_adm)

mapping_exclbreastfed_adm = c(
	"1" = "Never exclusively breastfed",
	"2" = "1 month",
	"3" = "2 months",
	"4" = "3 months",
	"5" = "4 months",
	"6" = "5 months",
	"7" = "6 months",
	"8" = "More than 6 months",
	"97" = "Unknown",
	"10" = "Currently exclusively breastfed"
)
data$exclbreastfed_adm.factor = factor(data$exclbreastfed_adm, levels = names(mapping_exclbreastfed_adm), labels = mapping_exclbreastfed_adm)

mapping_nonexclbreastfed_adm = c(
	"1" = "100% formula",
	"2" = "Mixed breastfeeding and formula",
	"3" = "Mixed breastfeeding and other",
	"4" = "Mixed formula and other",
	"5" = "100% other"
)
data$nonexclbreastfed_adm.factor = factor(data$nonexclbreastfed_adm, levels = names(mapping_nonexclbreastfed_adm), labels = mapping_nonexclbreastfed_adm)

mapping_totalbreastfed_adm = c(
	"1" = "Still being breastfed",
	"2" = "0-3 months",
	"3" = "4-6 months",
	"4" = "7-12 months",
	"5" = ">12 months",
	"97" = "Unknown"
)
data$totalbreastfed_adm.factor = factor(data$totalbreastfed_adm, levels = names(mapping_totalbreastfed_adm), labels = mapping_totalbreastfed_adm)

mapping_deliveryloc_adm = c(
	"1" = "Hospital",
	"2" = "Health centre",
	"3" = "Clinic",
	"4" = "Home",
	"98" = "Other"
)
data$deliveryloc_adm.factor = factor(data$deliveryloc_adm, levels = names(mapping_deliveryloc_adm), labels = mapping_deliveryloc_adm)

mapping_birthattend_adm = c(
	"1" = "Doctor / Clinical officer",
	"2" = "Nurse / midwife",
	"3" = "Traditional birth attendant",
	"4" = "Relative",
	"0" = "None",
	"98" = "Other"
)
data$birthattend_adm.factor = factor(data$birthattend_adm, levels = names(mapping_birthattend_adm), labels = mapping_birthattend_adm)

mapping_duedateknown_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$duedateknown_adm.factor = factor(data$duedateknown_adm, levels = names(mapping_duedateknown_adm), labels = mapping_duedateknown_adm)

mapping_birthdetail_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthdetail_adm___1.factor = factor(data$birthdetail_adm___1, levels = names(mapping_birthdetail_adm___1), labels = mapping_birthdetail_adm___1)

mapping_birthdetail_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthdetail_adm___2.factor = factor(data$birthdetail_adm___2, levels = names(mapping_birthdetail_adm___2), labels = mapping_birthdetail_adm___2)

mapping_birthdetail_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthdetail_adm___3.factor = factor(data$birthdetail_adm___3, levels = names(mapping_birthdetail_adm___3), labels = mapping_birthdetail_adm___3)

mapping_birthdetail_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthdetail_adm___4.factor = factor(data$birthdetail_adm___4, levels = names(mapping_birthdetail_adm___4), labels = mapping_birthdetail_adm___4)

mapping_birthdetail_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthdetail_adm___5.factor = factor(data$birthdetail_adm___5, levels = names(mapping_birthdetail_adm___5), labels = mapping_birthdetail_adm___5)

mapping_birthdetail_adm___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$birthdetail_adm___97.factor = factor(data$birthdetail_adm___97, levels = names(mapping_birthdetail_adm___97), labels = mapping_birthdetail_adm___97)

mapping_febrilestudy_admit = c(
	"1" = "Yes",
	"0" = "No"
)
data$febrilestudy_admit.factor = factor(data$febrilestudy_admit, levels = names(mapping_febrilestudy_admit), labels = mapping_febrilestudy_admit)

mapping_febrilestudy_consent_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$febrilestudy_consent_adm.factor = factor(data$febrilestudy_consent_adm, levels = names(mapping_febrilestudy_consent_adm), labels = mapping_febrilestudy_consent_adm)

mapping_admission_variables_clinical_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$admission_variables_clinical_complete.factor = factor(data$admission_variables_clinical_complete, levels = names(mapping_admission_variables_clinical_complete), labels = mapping_admission_variables_clinical_complete)

mapping_travelmethod_adm = c(
	"1" = "Private vehicle",
	"2" = "Taxi/special hire",
	"3" = "Ambulance",
	"4" = "Motorcycle",
	"5" = "Walking",
	"98" = "Other"
)
data$travelmethod_adm.factor = factor(data$travelmethod_adm, levels = names(mapping_travelmethod_adm), labels = mapping_travelmethod_adm)

mapping_traveldist_adm = c(
	"1" = "< 30 minutes",
	"2" = "30 minutes to < 1 hour",
	"3" = "1 hour to < 2 hours",
	"4" = "2 hours to < 3 hours",
	"5" = "3 hours to < 4 hours",
	"6" = "4 hours to < 8 hours",
	"7" = "8 hours or more"
)
data$traveldist_adm.factor = factor(data$traveldist_adm, levels = names(mapping_traveldist_adm), labels = mapping_traveldist_adm)

mapping_priorhealth_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Unknown"
)
data$priorhealth_adm.factor = factor(data$priorhealth_adm, levels = names(mapping_priorhealth_adm), labels = mapping_priorhealth_adm)

mapping_badhealthduration_adm = c(
	"1" = "< 1 week",
	"2" = "1 week to < 1 month",
	"3" = "1 month to < 1 year",
	"4" = "1 year or more"
)
data$badhealthduration_adm.factor = factor(data$badhealthduration_adm, levels = names(mapping_badhealthduration_adm), labels = mapping_badhealthduration_adm)

mapping_tradhealer_adm = c(
	"1" = "Traditional Medicine only",
	"2" = "Traditional Healers only",
	"3" = "Both Traditional medicines and healers",
	"0" = "No",
	"97" = "Dont know"
)
data$tradhealer_adm.factor = factor(data$tradhealer_adm, levels = names(mapping_tradhealer_adm), labels = mapping_tradhealer_adm)

mapping_caregiver_adm = c(
	"1" = "Biological parent",
	"2" = "Grandparent",
	"3" = "Sibling",
	"4" = "Aunt / uncle / cousin",
	"5" = "Stepmother / stepfather",
	"6" = "Care home / orphanage",
	"98" = "Other"
)
data$caregiver_adm.factor = factor(data$caregiver_adm, levels = names(mapping_caregiver_adm), labels = mapping_caregiver_adm)

mapping_caregiversex_adm = c(
	"1" = "Female",
	"2" = "Male",
	"99" = "N/A (in care)"
)
data$caregiversex_adm.factor = factor(data$caregiversex_adm, levels = names(mapping_caregiversex_adm), labels = mapping_caregiversex_adm)

mapping_caregiverage_adm = c(
	"1" = "< 19 years",
	"2" = "19 years to < 51 years",
	"3" = "51 years or more",
	"99" = "N/A (in care)"
)
data$caregiverage_adm.factor = factor(data$caregiverage_adm, levels = names(mapping_caregiverage_adm), labels = mapping_caregiverage_adm)

mapping_caregivermarried_adm = c(
	"1" = "Married monogamous",
	"2" = "Married polygamous",
	"3" = "Single",
	"4" = "Separated/divorced",
	"5" = "Widowed",
	"99" = "NA"
)
data$caregivermarried_adm.factor = factor(data$caregivermarried_adm, levels = names(mapping_caregivermarried_adm), labels = mapping_caregivermarried_adm)

mapping_momalive_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$momalive_adm.factor = factor(data$momalive_adm, levels = names(mapping_momalive_adm), labels = mapping_momalive_adm)

mapping_momageknown_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$momageknown_adm.factor = factor(data$momageknown_adm, levels = names(mapping_momageknown_adm), labels = mapping_momageknown_adm)

mapping_momagecat_adm = c(
	"1" = "< 18 years",
	"2" = "18 years to < 26 years",
	"3" = "26 years to < 36 years",
	"4" = "36 years or more"
)
data$momagecat_adm.factor = factor(data$momagecat_adm, levels = names(mapping_momagecat_adm), labels = mapping_momagecat_adm)

mapping_momagefirstpregknown_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$momagefirstpregknown_adm.factor = factor(data$momagefirstpregknown_adm, levels = names(mapping_momagefirstpregknown_adm), labels = mapping_momagefirstpregknown_adm)

mapping_momedu_adm = c(
	"1" = "No school",
	"2" = "< = P3",
	"3" = "P4-P7",
	"4" = "S1-S6",
	"5" = "Post secondary (including post S4 technical school)",
	"97" = "Dont know"
)
data$momedu_adm.factor = factor(data$momedu_adm, levels = names(mapping_momedu_adm), labels = mapping_momedu_adm)

mapping_momhiv_adm = c(
	"1" = "Positive",
	"0" = "Negative",
	"97" = "Unknown"
)
data$momhiv_adm.factor = factor(data$momhiv_adm, levels = names(mapping_momhiv_adm), labels = mapping_momhiv_adm)

mapping_momhivtx_adm = c(
	"1" = "On ART",
	"0" = "Not on ART",
	"97" = "Dont know"
)
data$momhivtx_adm.factor = factor(data$momhivtx_adm, levels = names(mapping_momhivtx_adm), labels = mapping_momhivtx_adm)

mapping_childedu_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$childedu_adm.factor = factor(data$childedu_adm, levels = names(mapping_childedu_adm), labels = mapping_childedu_adm)

mapping_childedulevel_adm = c(
	"14" = "Pre-primary",
	"1" = "P1",
	"2" = "P2",
	"3" = "P3",
	"4" = "P4",
	"5" = "P5",
	"6" = "P6",
	"7" = "P7",
	"8" = "S1",
	"9" = "S2",
	"10" = "S3",
	"11" = "S4",
	"12" = "S5",
	"13" = "S6",
	"0" = "None"
)
data$childedulevel_adm.factor = factor(data$childedulevel_adm, levels = names(mapping_childedulevel_adm), labels = mapping_childedulevel_adm)

mapping_diffhome_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$diffhome_adm.factor = factor(data$diffhome_adm, levels = names(mapping_diffhome_adm), labels = mapping_diffhome_adm)

mapping_diffhome_num_adm = c(
	"1" = "1",
	"2" = "2",
	"3" = "3",
	"4" = "4",
	"5" = "5",
	"6" = "More than 5"
)
data$diffhome_num_adm.factor = factor(data$diffhome_num_adm, levels = names(mapping_diffhome_num_adm), labels = mapping_diffhome_num_adm)

mapping_watersource_adm = c(
	"1" = "Protected spring",
	"2" = "Bore hole",
	"3" = "Municipal water / tap water / piped water",
	"4" = "Open source (unprotected, stagnant water, well, dam)",
	"5" = "Slow running water",
	"6" = "Fast running water",
	"7" = "Bottled water",
	"8" = "Rain water",
	"9" = "River/lake",
	"98" = "Other"
)
data$watersource_adm.factor = factor(data$watersource_adm, levels = names(mapping_watersource_adm), labels = mapping_watersource_adm)

mapping_waterwalk_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$waterwalk_adm.factor = factor(data$waterwalk_adm, levels = names(mapping_waterwalk_adm), labels = mapping_waterwalk_adm)

mapping_waterpure_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$waterpure_adm.factor = factor(data$waterpure_adm, levels = names(mapping_waterpure_adm), labels = mapping_waterpure_adm)

mapping_cookfuel_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___1.factor = factor(data$cookfuel_adm___1, levels = names(mapping_cookfuel_adm___1), labels = mapping_cookfuel_adm___1)

mapping_cookfuel_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___2.factor = factor(data$cookfuel_adm___2, levels = names(mapping_cookfuel_adm___2), labels = mapping_cookfuel_adm___2)

mapping_cookfuel_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___3.factor = factor(data$cookfuel_adm___3, levels = names(mapping_cookfuel_adm___3), labels = mapping_cookfuel_adm___3)

mapping_cookfuel_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___4.factor = factor(data$cookfuel_adm___4, levels = names(mapping_cookfuel_adm___4), labels = mapping_cookfuel_adm___4)

mapping_cookfuel_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___5.factor = factor(data$cookfuel_adm___5, levels = names(mapping_cookfuel_adm___5), labels = mapping_cookfuel_adm___5)

mapping_cookfuel_adm___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___6.factor = factor(data$cookfuel_adm___6, levels = names(mapping_cookfuel_adm___6), labels = mapping_cookfuel_adm___6)

mapping_cookfuel_adm___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___7.factor = factor(data$cookfuel_adm___7, levels = names(mapping_cookfuel_adm___7), labels = mapping_cookfuel_adm___7)

mapping_cookfuel_adm___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___8.factor = factor(data$cookfuel_adm___8, levels = names(mapping_cookfuel_adm___8), labels = mapping_cookfuel_adm___8)

mapping_cookfuel_adm___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$cookfuel_adm___98.factor = factor(data$cookfuel_adm___98, levels = names(mapping_cookfuel_adm___98), labels = mapping_cookfuel_adm___98)

mapping_cookloc_adm = c(
	"1" = "In the house where you sleep",
	"2" = "Outdoors in the open",
	"3" = "In a separate building/building space used as a kitchen"
)
data$cookloc_adm.factor = factor(data$cookloc_adm, levels = names(mapping_cookloc_adm), labels = mapping_cookloc_adm)

mapping_food_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$food_adm.factor = factor(data$food_adm, levels = names(mapping_food_adm), labels = mapping_food_adm)

mapping_lightfuel_adm = c(
	"1" = "Kerosene lamp",
	"2" = "Tadooba/Koroboi",
	"3" = "Candles",
	"4" = "Solar lantern",
	"5" = "Solar powered bulbs",
	"6" = "Battery-powered light",
	"7" = "Electric bulbs (national grid)",
	"98" = "Other (specify):"
)
data$lightfuel_adm.factor = factor(data$lightfuel_adm, levels = names(mapping_lightfuel_adm), labels = mapping_lightfuel_adm)

mapping_tobacco_adm = c(
	"1" = "Daily",
	"2" = "Weekly",
	"3" = "Monthly",
	"4" = "Less than monthly",
	"5" = "Never"
)
data$tobacco_adm.factor = factor(data$tobacco_adm, levels = names(mapping_tobacco_adm), labels = mapping_tobacco_adm)

mapping_bednet_adm = c(
	"1" = "Never",
	"2" = "Sometimes",
	"3" = "Always"
)
data$bednet_adm.factor = factor(data$bednet_adm, levels = names(mapping_bednet_adm), labels = mapping_bednet_adm)

mapping_flooring_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$flooring_adm___1.factor = factor(data$flooring_adm___1, levels = names(mapping_flooring_adm___1), labels = mapping_flooring_adm___1)

mapping_flooring_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$flooring_adm___2.factor = factor(data$flooring_adm___2, levels = names(mapping_flooring_adm___2), labels = mapping_flooring_adm___2)

mapping_flooring_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$flooring_adm___3.factor = factor(data$flooring_adm___3, levels = names(mapping_flooring_adm___3), labels = mapping_flooring_adm___3)

mapping_flooring_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$flooring_adm___4.factor = factor(data$flooring_adm___4, levels = names(mapping_flooring_adm___4), labels = mapping_flooring_adm___4)

mapping_flooring_adm___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$flooring_adm___98.factor = factor(data$flooring_adm___98, levels = names(mapping_flooring_adm___98), labels = mapping_flooring_adm___98)

mapping_toilettype_adm = c(
	"1" = "Flush toilet system (sitting or squatting)",
	"2" = "Ventilated improved pit (VIP) Latrine",
	"3" = "Composting toilet",
	"4" = "Pit latrine",
	"5" = "Bucket toilet",
	"96" = "No toilet",
	"98" = "Other"
)
data$toilettype_adm.factor = factor(data$toilettype_adm, levels = names(mapping_toilettype_adm), labels = mapping_toilettype_adm)

mapping_toiletshare_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$toiletshare_adm.factor = factor(data$toiletshare_adm, levels = names(mapping_toiletshare_adm), labels = mapping_toiletshare_adm)

mapping_appliances_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$appliances_adm___1.factor = factor(data$appliances_adm___1, levels = names(mapping_appliances_adm___1), labels = mapping_appliances_adm___1)

mapping_appliances_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$appliances_adm___2.factor = factor(data$appliances_adm___2, levels = names(mapping_appliances_adm___2), labels = mapping_appliances_adm___2)

mapping_appliances_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$appliances_adm___3.factor = factor(data$appliances_adm___3, levels = names(mapping_appliances_adm___3), labels = mapping_appliances_adm___3)

mapping_appliances_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$appliances_adm___4.factor = factor(data$appliances_adm___4, levels = names(mapping_appliances_adm___4), labels = mapping_appliances_adm___4)

mapping_appliances_adm___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$appliances_adm___96.factor = factor(data$appliances_adm___96, levels = names(mapping_appliances_adm___96), labels = mapping_appliances_adm___96)

mapping_possessions_adm___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$possessions_adm___1.factor = factor(data$possessions_adm___1, levels = names(mapping_possessions_adm___1), labels = mapping_possessions_adm___1)

mapping_possessions_adm___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$possessions_adm___2.factor = factor(data$possessions_adm___2, levels = names(mapping_possessions_adm___2), labels = mapping_possessions_adm___2)

mapping_possessions_adm___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$possessions_adm___3.factor = factor(data$possessions_adm___3, levels = names(mapping_possessions_adm___3), labels = mapping_possessions_adm___3)

mapping_possessions_adm___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$possessions_adm___4.factor = factor(data$possessions_adm___4, levels = names(mapping_possessions_adm___4), labels = mapping_possessions_adm___4)

mapping_possessions_adm___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$possessions_adm___5.factor = factor(data$possessions_adm___5, levels = names(mapping_possessions_adm___5), labels = mapping_possessions_adm___5)

mapping_possessions_adm___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$possessions_adm___96.factor = factor(data$possessions_adm___96, levels = names(mapping_possessions_adm___96), labels = mapping_possessions_adm___96)

mapping_internetuse_adm = c(
	"1" = "In the past 24 hours",
	"2" = "In the past week",
	"3" = "In the past month",
	"4" = "In the past several months (> 1 month)",
	"0" = "Never"
)
data$internetuse_adm.factor = factor(data$internetuse_adm, levels = names(mapping_internetuse_adm), labels = mapping_internetuse_adm)

mapping_internetuse_illness_adm = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$internetuse_illness_adm.factor = factor(data$internetuse_illness_adm, levels = names(mapping_internetuse_illness_adm), labels = mapping_internetuse_illness_adm)

mapping_roomcount_adm = c(
	"1" = "One",
	"2" = "Two",
	"3" = "Three",
	"4" = "More than three"
)
data$roomcount_adm.factor = factor(data$roomcount_adm, levels = names(mapping_roomcount_adm), labels = mapping_roomcount_adm)

mapping_admission_variables_social_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$admission_variables_social_complete.factor = factor(data$admission_variables_social_complete, levels = names(mapping_admission_variables_social_complete), labels = mapping_admission_variables_social_complete)

mapping_hemoglobin_significant_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$hemoglobin_significant_adm.factor = factor(data$hemoglobin_significant_adm, levels = names(mapping_hemoglobin_significant_adm), labels = mapping_hemoglobin_significant_adm)

mapping_hctpretransfusion_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$hctpretransfusion_adm.factor = factor(data$hctpretransfusion_adm, levels = names(mapping_hctpretransfusion_adm), labels = mapping_hctpretransfusion_adm)

mapping_hivstatus_adm = c(
	"96" = "Refused Test",
	"1" = "HIV positive",
	"0" = "HIV negative"
)
data$hivstatus_adm.factor = factor(data$hivstatus_adm, levels = names(mapping_hivstatus_adm), labels = mapping_hivstatus_adm)

mapping_malariastatuspos_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$malariastatuspos_adm.factor = factor(data$malariastatuspos_adm, levels = names(mapping_malariastatuspos_adm), labels = mapping_malariastatuspos_adm)

mapping_lactate_significant_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$lactate_significant_adm.factor = factor(data$lactate_significant_adm, levels = names(mapping_lactate_significant_adm), labels = mapping_lactate_significant_adm)

mapping_lactateampm_adm = c(
	"1" = "AM",
	"2" = "PM"
)
data$lactateampm_adm.factor = factor(data$lactateampm_adm, levels = names(mapping_lactateampm_adm), labels = mapping_lactateampm_adm)

mapping_lactate2_significant_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$lactate2_significant_adm.factor = factor(data$lactate2_significant_adm, levels = names(mapping_lactate2_significant_adm), labels = mapping_lactate2_significant_adm)

mapping_latelactatetime_adm = c(
	"1" = "8 hours",
	"2" = "16 hours",
	"98" = "Other"
)
data$latelactatetime_adm.factor = factor(data$latelactatetime_adm, levels = names(mapping_latelactatetime_adm), labels = mapping_latelactatetime_adm)

mapping_glucose_significant_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$glucose_significant_adm.factor = factor(data$glucose_significant_adm, levels = names(mapping_glucose_significant_adm), labels = mapping_glucose_significant_adm)

mapping_sun_gpdl_adm = c(
	"1" = "1 (5-10mg/dl)",
	"2" = "2 (11-20mg/dl)",
	"3" = "3 (21-30mg/dl)",
	"4" = "4 (31-40mg/dl)",
	"5" = "5 (41-50mg/dl)",
	"6" = "6 (75+ mg/dl)"
)
data$sun_gpdl_adm.factor = factor(data$sun_gpdl_adm, levels = names(mapping_sun_gpdl_adm), labels = mapping_sun_gpdl_adm)

mapping_creatinine_significant_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$creatinine_significant_adm.factor = factor(data$creatinine_significant_adm, levels = names(mapping_creatinine_significant_adm), labels = mapping_creatinine_significant_adm)

mapping_creatinineoutside_adm = c(
	"1" = "Low",
	"2" = "High"
)
data$creatinineoutside_adm.factor = factor(data$creatinineoutside_adm, levels = names(mapping_creatinineoutside_adm), labels = mapping_creatinineoutside_adm)

mapping_urinalysisampm_adm = c(
	"1" = "AM",
	"2" = "PM"
)
data$urinalysisampm_adm.factor = factor(data$urinalysisampm_adm, levels = names(mapping_urinalysisampm_adm), labels = mapping_urinalysisampm_adm)

mapping_cbc_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$cbc_adm.factor = factor(data$cbc_adm, levels = names(mapping_cbc_adm), labels = mapping_cbc_adm)

mapping_platelets_significant_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$platelets_significant_adm.factor = factor(data$platelets_significant_adm, levels = names(mapping_platelets_significant_adm), labels = mapping_platelets_significant_adm)

mapping_urob_umolpl_adm = c(
	"1" = "0.1-Normal-16",
	"2" = "33",
	"3" = "66",
	"4" = "131"
)
data$urob_umolpl_adm.factor = factor(data$urob_umolpl_adm, levels = names(mapping_urob_umolpl_adm), labels = mapping_urob_umolpl_adm)

mapping_urineglucose_mmolpl_adm = c(
	"1" = "Neg",
	"2" = "5 (Trace)",
	"3" = "5.5",
	"4" = "14",
	"5" = "28",
	"6" = "55"
)
data$urineglucose_mmolpl_adm.factor = factor(data$urineglucose_mmolpl_adm, levels = names(mapping_urineglucose_mmolpl_adm), labels = mapping_urineglucose_mmolpl_adm)

mapping_bilirubin_umolpl_adm = c(
	"0" = "Neg",
	"1" = "+",
	"2" = "++",
	"3" = "+++"
)
data$bilirubin_umolpl_adm.factor = factor(data$bilirubin_umolpl_adm, levels = names(mapping_bilirubin_umolpl_adm), labels = mapping_bilirubin_umolpl_adm)

mapping_ketone_mmolpl_adm = c(
	"1" = "Neg",
	"2" = "0.5",
	"3" = "1.5",
	"4" = "3.9",
	"5" = "10"
)
data$ketone_mmolpl_adm.factor = factor(data$ketone_mmolpl_adm, levels = names(mapping_ketone_mmolpl_adm), labels = mapping_ketone_mmolpl_adm)

mapping_gravity_adm = c(
	"1" = "1.000",
	"2" = "1.005",
	"3" = "1.010",
	"4" = "1.015",
	"5" = "1.020",
	"6" = "1.025",
	"7" = "1.030"
)
data$gravity_adm.factor = factor(data$gravity_adm, levels = names(mapping_gravity_adm), labels = mapping_gravity_adm)

mapping_blood_cellspul_adm = c(
	"1" = "Neg",
	"2" = "Hemolysis+10",
	"3" = "Hemolysis++50",
	"4" = "Hemolysis+++250",
	"5" = "Non hemolysis+10",
	"6" = "Non hemolysis++50"
)
data$blood_cellspul_adm.factor = factor(data$blood_cellspul_adm, levels = names(mapping_blood_cellspul_adm), labels = mapping_blood_cellspul_adm)

mapping_ph_adm = c(
	"1" = "5.0",
	"2" = "6.0",
	"3" = "6.5",
	"4" = "7.0",
	"5" = "8.0",
	"6" = "9"
)
data$ph_adm.factor = factor(data$ph_adm, levels = names(mapping_ph_adm), labels = mapping_ph_adm)

mapping_protein_gpl_adm = c(
	"1" = "Neg",
	"2" = "Trace",
	"3" = "0.3",
	"4" = "1.0",
	"5" = "3.0",
	"6" = "10.0"
)
data$protein_gpl_adm.factor = factor(data$protein_gpl_adm, levels = names(mapping_protein_gpl_adm), labels = mapping_protein_gpl_adm)

mapping_nitritestatus_adm = c(
	"1" = "Neg",
	"2" = "Trace",
	"3" = "Pos"
)
data$nitritestatus_adm.factor = factor(data$nitritestatus_adm, levels = names(mapping_nitritestatus_adm), labels = mapping_nitritestatus_adm)

mapping_leucocytes_cellpul_adm = c(
	"1" = "Neg",
	"2" = "+25",
	"3" = "++75",
	"4" = "+++500"
)
data$leucocytes_cellpul_adm.factor = factor(data$leucocytes_cellpul_adm, levels = names(mapping_leucocytes_cellpul_adm), labels = mapping_leucocytes_cellpul_adm)

mapping_ungal_col_adm = c(
	"1" = "Yes",
	"0" = "No"
)
data$ungal_col_adm.factor = factor(data$ungal_col_adm, levels = names(mapping_ungal_col_adm), labels = mapping_ungal_col_adm)

mapping_labapproval_adm = c(
	"1" = "Clare",
	"2" = "Christine"
)
data$labapproval_adm.factor = factor(data$labapproval_adm, levels = names(mapping_labapproval_adm), labels = mapping_labapproval_adm)

mapping_admission_variables_laboratory_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$admission_variables_laboratory_complete.factor = factor(data$admission_variables_laboratory_complete, levels = names(mapping_admission_variables_laboratory_complete), labels = mapping_admission_variables_laboratory_complete)

mapping_fss_and_pedsql_patient_details_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$fss_and_pedsql_patient_details_complete.factor = factor(data$fss_and_pedsql_patient_details_complete, levels = names(mapping_fss_and_pedsql_patient_details_complete), labels = mapping_fss_and_pedsql_patient_details_complete)

mapping_is_fsspilot_fss = c(
	"1" = "Yes",
	"0" = "No"
)
data$is_fsspilot_fss.factor = factor(data$is_fsspilot_fss, levels = names(mapping_is_fsspilot_fss), labels = mapping_is_fsspilot_fss)

mapping_agecateg_pr_psql = c(
	"0" = "5-7 years",
	"1" = "8-12 years",
	"2" = "13-16 years"
)
data$agecateg_pr_psql.factor = factor(data$agecateg_pr_psql, levels = names(mapping_agecateg_pr_psql), labels = mapping_agecateg_pr_psql)

mapping_mental_fss = c(
	"1" = "1. Normal",
	"2" = "2. Mild",
	"3" = "3. Moderate",
	"4" = "4. Severe",
	"5" = "5. Very Severe"
)
data$mental_fss.factor = factor(data$mental_fss, levels = names(mapping_mental_fss), labels = mapping_mental_fss)

mapping_sensory_fss = c(
	"1" = "1. Normal",
	"2" = "2. Mild",
	"3" = "3. Moderate",
	"4" = "4. Severe",
	"5" = "5. Very Severe"
)
data$sensory_fss.factor = factor(data$sensory_fss, levels = names(mapping_sensory_fss), labels = mapping_sensory_fss)

mapping_comm_fss = c(
	"1" = "1. Normal",
	"2" = "2. Mild",
	"3" = "3. Moderate",
	"4" = "4. Severe",
	"5" = "5. Very Severe"
)
data$comm_fss.factor = factor(data$comm_fss, levels = names(mapping_comm_fss), labels = mapping_comm_fss)

mapping_motor_fss = c(
	"1" = "1. Normal",
	"2" = "2. Mild",
	"3" = "3. Moderate",
	"4" = "4. Severe",
	"5" = "5. Very Severe"
)
data$motor_fss.factor = factor(data$motor_fss, levels = names(mapping_motor_fss), labels = mapping_motor_fss)

mapping_feed_fss = c(
	"1" = "1. Normal",
	"2" = "2. Mild",
	"3" = "3. Moderate",
	"4" = "4. Severe",
	"5" = "5. Very Severe"
)
data$feed_fss.factor = factor(data$feed_fss, levels = names(mapping_feed_fss), labels = mapping_feed_fss)

mapping_resp_fss = c(
	"1" = "1. Normal",
	"2" = "2. Mild",
	"3" = "3. Moderate",
	"4" = "4. Severe",
	"5" = "5. Very Severe"
)
data$resp_fss.factor = factor(data$resp_fss, levels = names(mapping_resp_fss), labels = mapping_resp_fss)

mapping_pf_walk_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_walk_5to7_pr_psql.factor = factor(data$pf_walk_5to7_pr_psql, levels = names(mapping_pf_walk_5to7_pr_psql), labels = mapping_pf_walk_5to7_pr_psql)

mapping_pf_run_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_run_5to7_pr_psql.factor = factor(data$pf_run_5to7_pr_psql, levels = names(mapping_pf_run_5to7_pr_psql), labels = mapping_pf_run_5to7_pr_psql)

mapping_pf_sprt_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_sprt_5to7_pr_psql.factor = factor(data$pf_sprt_5to7_pr_psql, levels = names(mapping_pf_sprt_5to7_pr_psql), labels = mapping_pf_sprt_5to7_pr_psql)

mapping_pf_lift_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_lift_5to7_pr_psql.factor = factor(data$pf_lift_5to7_pr_psql, levels = names(mapping_pf_lift_5to7_pr_psql), labels = mapping_pf_lift_5to7_pr_psql)

mapping_pf_bath_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_bath_5to7_pr_psql.factor = factor(data$pf_bath_5to7_pr_psql, levels = names(mapping_pf_bath_5to7_pr_psql), labels = mapping_pf_bath_5to7_pr_psql)

mapping_pf_chor_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_chor_5to7_pr_psql.factor = factor(data$pf_chor_5to7_pr_psql, levels = names(mapping_pf_chor_5to7_pr_psql), labels = mapping_pf_chor_5to7_pr_psql)

mapping_pf_hurt_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_hurt_5to7_pr_psql.factor = factor(data$pf_hurt_5to7_pr_psql, levels = names(mapping_pf_hurt_5to7_pr_psql), labels = mapping_pf_hurt_5to7_pr_psql)

mapping_pf_enrgy_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_enrgy_5to7_pr_psql.factor = factor(data$pf_enrgy_5to7_pr_psql, levels = names(mapping_pf_enrgy_5to7_pr_psql), labels = mapping_pf_enrgy_5to7_pr_psql)

mapping_pf_walk_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_walk_8to12_pr_psql.factor = factor(data$pf_walk_8to12_pr_psql, levels = names(mapping_pf_walk_8to12_pr_psql), labels = mapping_pf_walk_8to12_pr_psql)

mapping_pf_run_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_run_8to12_pr_psql.factor = factor(data$pf_run_8to12_pr_psql, levels = names(mapping_pf_run_8to12_pr_psql), labels = mapping_pf_run_8to12_pr_psql)

mapping_pf_sprt_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_sprt_8to12_pr_psql.factor = factor(data$pf_sprt_8to12_pr_psql, levels = names(mapping_pf_sprt_8to12_pr_psql), labels = mapping_pf_sprt_8to12_pr_psql)

mapping_pf_lift_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_lift_8to12_pr_psql.factor = factor(data$pf_lift_8to12_pr_psql, levels = names(mapping_pf_lift_8to12_pr_psql), labels = mapping_pf_lift_8to12_pr_psql)

mapping_pf_bath_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_bath_8to12_pr_psql.factor = factor(data$pf_bath_8to12_pr_psql, levels = names(mapping_pf_bath_8to12_pr_psql), labels = mapping_pf_bath_8to12_pr_psql)

mapping_pf_chor_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_chor_8to12_pr_psql.factor = factor(data$pf_chor_8to12_pr_psql, levels = names(mapping_pf_chor_8to12_pr_psql), labels = mapping_pf_chor_8to12_pr_psql)

mapping_pf_hurt_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_hurt_8to12_pr_psql.factor = factor(data$pf_hurt_8to12_pr_psql, levels = names(mapping_pf_hurt_8to12_pr_psql), labels = mapping_pf_hurt_8to12_pr_psql)

mapping_pf_enrgy_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_enrgy_8to12_pr_psql.factor = factor(data$pf_enrgy_8to12_pr_psql, levels = names(mapping_pf_enrgy_8to12_pr_psql), labels = mapping_pf_enrgy_8to12_pr_psql)

mapping_pf_walk_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_walk_13to16_pr_psql.factor = factor(data$pf_walk_13to16_pr_psql, levels = names(mapping_pf_walk_13to16_pr_psql), labels = mapping_pf_walk_13to16_pr_psql)

mapping_pf_run_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_run_13to16_pr_psql.factor = factor(data$pf_run_13to16_pr_psql, levels = names(mapping_pf_run_13to16_pr_psql), labels = mapping_pf_run_13to16_pr_psql)

mapping_pf_sprt_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_sprt_13to16_pr_psql.factor = factor(data$pf_sprt_13to16_pr_psql, levels = names(mapping_pf_sprt_13to16_pr_psql), labels = mapping_pf_sprt_13to16_pr_psql)

mapping_pf_lift_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_lift_13to16_pr_psql.factor = factor(data$pf_lift_13to16_pr_psql, levels = names(mapping_pf_lift_13to16_pr_psql), labels = mapping_pf_lift_13to16_pr_psql)

mapping_pf_bath_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_bath_13to16_pr_psql.factor = factor(data$pf_bath_13to16_pr_psql, levels = names(mapping_pf_bath_13to16_pr_psql), labels = mapping_pf_bath_13to16_pr_psql)

mapping_pf_chor_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_chor_13to16_pr_psql.factor = factor(data$pf_chor_13to16_pr_psql, levels = names(mapping_pf_chor_13to16_pr_psql), labels = mapping_pf_chor_13to16_pr_psql)

mapping_pf_hurt_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_hurt_13to16_pr_psql.factor = factor(data$pf_hurt_13to16_pr_psql, levels = names(mapping_pf_hurt_13to16_pr_psql), labels = mapping_pf_hurt_13to16_pr_psql)

mapping_pf_enrgy_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_enrgy_13to16_pr_psql.factor = factor(data$pf_enrgy_13to16_pr_psql, levels = names(mapping_pf_enrgy_13to16_pr_psql), labels = mapping_pf_enrgy_13to16_pr_psql)

mapping_ef_afrd_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_afrd_5to7_pr_psql.factor = factor(data$ef_afrd_5to7_pr_psql, levels = names(mapping_ef_afrd_5to7_pr_psql), labels = mapping_ef_afrd_5to7_pr_psql)

mapping_ef_sad_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sad_5to7_pr_psql.factor = factor(data$ef_sad_5to7_pr_psql, levels = names(mapping_ef_sad_5to7_pr_psql), labels = mapping_ef_sad_5to7_pr_psql)

mapping_ef_angr_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_angr_5to7_pr_psql.factor = factor(data$ef_angr_5to7_pr_psql, levels = names(mapping_ef_angr_5to7_pr_psql), labels = mapping_ef_angr_5to7_pr_psql)

mapping_ef_sleep_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sleep_5to7_pr_psql.factor = factor(data$ef_sleep_5to7_pr_psql, levels = names(mapping_ef_sleep_5to7_pr_psql), labels = mapping_ef_sleep_5to7_pr_psql)

mapping_ef_worry_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_worry_5to7_pr_psql.factor = factor(data$ef_worry_5to7_pr_psql, levels = names(mapping_ef_worry_5to7_pr_psql), labels = mapping_ef_worry_5to7_pr_psql)

mapping_ef_afrd_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_afrd_8to12_pr_psql.factor = factor(data$ef_afrd_8to12_pr_psql, levels = names(mapping_ef_afrd_8to12_pr_psql), labels = mapping_ef_afrd_8to12_pr_psql)

mapping_ef_sad_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sad_8to12_pr_psql.factor = factor(data$ef_sad_8to12_pr_psql, levels = names(mapping_ef_sad_8to12_pr_psql), labels = mapping_ef_sad_8to12_pr_psql)

mapping_ef_angr_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_angr_8to12_pr_psql.factor = factor(data$ef_angr_8to12_pr_psql, levels = names(mapping_ef_angr_8to12_pr_psql), labels = mapping_ef_angr_8to12_pr_psql)

mapping_ef_sleep_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sleep_8to12_pr_psql.factor = factor(data$ef_sleep_8to12_pr_psql, levels = names(mapping_ef_sleep_8to12_pr_psql), labels = mapping_ef_sleep_8to12_pr_psql)

mapping_ef_worry_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_worry_8to12_pr_psql.factor = factor(data$ef_worry_8to12_pr_psql, levels = names(mapping_ef_worry_8to12_pr_psql), labels = mapping_ef_worry_8to12_pr_psql)

mapping_ef_afrd_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_afrd_13to16_pr_psql.factor = factor(data$ef_afrd_13to16_pr_psql, levels = names(mapping_ef_afrd_13to16_pr_psql), labels = mapping_ef_afrd_13to16_pr_psql)

mapping_ef_sad_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sad_13to16_pr_psql.factor = factor(data$ef_sad_13to16_pr_psql, levels = names(mapping_ef_sad_13to16_pr_psql), labels = mapping_ef_sad_13to16_pr_psql)

mapping_ef_angr_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_angr_13to16_pr_psql.factor = factor(data$ef_angr_13to16_pr_psql, levels = names(mapping_ef_angr_13to16_pr_psql), labels = mapping_ef_angr_13to16_pr_psql)

mapping_ef_sleep_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sleep_13to16_pr_psql.factor = factor(data$ef_sleep_13to16_pr_psql, levels = names(mapping_ef_sleep_13to16_pr_psql), labels = mapping_ef_sleep_13to16_pr_psql)

mapping_ef_worry_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_worry_13to16_pr_psql.factor = factor(data$ef_worry_13to16_pr_psql, levels = names(mapping_ef_worry_13to16_pr_psql), labels = mapping_ef_worry_13to16_pr_psql)

mapping_sf_getalong_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_getalong_5to7_pr_psql.factor = factor(data$sf_getalong_5to7_pr_psql, levels = names(mapping_sf_getalong_5to7_pr_psql), labels = mapping_sf_getalong_5to7_pr_psql)

mapping_sf_nofriends_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_nofriends_5to7_pr_psql.factor = factor(data$sf_nofriends_5to7_pr_psql, levels = names(mapping_sf_nofriends_5to7_pr_psql), labels = mapping_sf_nofriends_5to7_pr_psql)

mapping_sf_teas_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_teas_5to7_pr_psql.factor = factor(data$sf_teas_5to7_pr_psql, levels = names(mapping_sf_teas_5to7_pr_psql), labels = mapping_sf_teas_5to7_pr_psql)

mapping_sf_notable_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_notable_5to7_pr_psql.factor = factor(data$sf_notable_5to7_pr_psql, levels = names(mapping_sf_notable_5to7_pr_psql), labels = mapping_sf_notable_5to7_pr_psql)

mapping_sf_keepingup_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_keepingup_5to7_pr_psql.factor = factor(data$sf_keepingup_5to7_pr_psql, levels = names(mapping_sf_keepingup_5to7_pr_psql), labels = mapping_sf_keepingup_5to7_pr_psql)

mapping_sf_getalong_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_getalong_8to12_pr_psql.factor = factor(data$sf_getalong_8to12_pr_psql, levels = names(mapping_sf_getalong_8to12_pr_psql), labels = mapping_sf_getalong_8to12_pr_psql)

mapping_sf_nofriends_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_nofriends_8to12_pr_psql.factor = factor(data$sf_nofriends_8to12_pr_psql, levels = names(mapping_sf_nofriends_8to12_pr_psql), labels = mapping_sf_nofriends_8to12_pr_psql)

mapping_sf_teas_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_teas_8to12_pr_psql.factor = factor(data$sf_teas_8to12_pr_psql, levels = names(mapping_sf_teas_8to12_pr_psql), labels = mapping_sf_teas_8to12_pr_psql)

mapping_sf_notable_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_notable_8to12_pr_psql.factor = factor(data$sf_notable_8to12_pr_psql, levels = names(mapping_sf_notable_8to12_pr_psql), labels = mapping_sf_notable_8to12_pr_psql)

mapping_sf_keepingup_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_keepingup_8to12_pr_psql.factor = factor(data$sf_keepingup_8to12_pr_psql, levels = names(mapping_sf_keepingup_8to12_pr_psql), labels = mapping_sf_keepingup_8to12_pr_psql)

mapping_sf_getalong_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_getalong_13to16_pr_psql.factor = factor(data$sf_getalong_13to16_pr_psql, levels = names(mapping_sf_getalong_13to16_pr_psql), labels = mapping_sf_getalong_13to16_pr_psql)

mapping_sf_nofriends_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_nofriends_13to16_pr_psql.factor = factor(data$sf_nofriends_13to16_pr_psql, levels = names(mapping_sf_nofriends_13to16_pr_psql), labels = mapping_sf_nofriends_13to16_pr_psql)

mapping_sf_teas_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_teas_13to16_pr_psql.factor = factor(data$sf_teas_13to16_pr_psql, levels = names(mapping_sf_teas_13to16_pr_psql), labels = mapping_sf_teas_13to16_pr_psql)

mapping_sf_notable_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_notable_13to16_pr_psql.factor = factor(data$sf_notable_13to16_pr_psql, levels = names(mapping_sf_notable_13to16_pr_psql), labels = mapping_sf_notable_13to16_pr_psql)

mapping_sf_keepingup_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_keepingup_13to16_pr_psql.factor = factor(data$sf_keepingup_13to16_pr_psql, levels = names(mapping_sf_keepingup_13to16_pr_psql), labels = mapping_sf_keepingup_13to16_pr_psql)

mapping_scf_attn_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_attn_5to7_pr_psql.factor = factor(data$scf_attn_5to7_pr_psql, levels = names(mapping_scf_attn_5to7_pr_psql), labels = mapping_scf_attn_5to7_pr_psql)

mapping_scf_frgt_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_frgt_5to7_pr_psql.factor = factor(data$scf_frgt_5to7_pr_psql, levels = names(mapping_scf_frgt_5to7_pr_psql), labels = mapping_scf_frgt_5to7_pr_psql)

mapping_scf_schlact_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlact_5to7_pr_psql.factor = factor(data$scf_schlact_5to7_pr_psql, levels = names(mapping_scf_schlact_5to7_pr_psql), labels = mapping_scf_schlact_5to7_pr_psql)

mapping_scf_schlfeel_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlfeel_5to7_pr_psql.factor = factor(data$scf_schlfeel_5to7_pr_psql, levels = names(mapping_scf_schlfeel_5to7_pr_psql), labels = mapping_scf_schlfeel_5to7_pr_psql)

mapping_scf_schldr_5to7_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schldr_5to7_pr_psql.factor = factor(data$scf_schldr_5to7_pr_psql, levels = names(mapping_scf_schldr_5to7_pr_psql), labels = mapping_scf_schldr_5to7_pr_psql)

mapping_scf_attn_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_attn_8to12_pr_psql.factor = factor(data$scf_attn_8to12_pr_psql, levels = names(mapping_scf_attn_8to12_pr_psql), labels = mapping_scf_attn_8to12_pr_psql)

mapping_scf_frgt_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_frgt_8to12_pr_psql.factor = factor(data$scf_frgt_8to12_pr_psql, levels = names(mapping_scf_frgt_8to12_pr_psql), labels = mapping_scf_frgt_8to12_pr_psql)

mapping_scf_schlact_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlact_8to12_pr_psql.factor = factor(data$scf_schlact_8to12_pr_psql, levels = names(mapping_scf_schlact_8to12_pr_psql), labels = mapping_scf_schlact_8to12_pr_psql)

mapping_scf_schlfeel_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlfeel_8to12_pr_psql.factor = factor(data$scf_schlfeel_8to12_pr_psql, levels = names(mapping_scf_schlfeel_8to12_pr_psql), labels = mapping_scf_schlfeel_8to12_pr_psql)

mapping_scf_schldr_8to12_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schldr_8to12_pr_psql.factor = factor(data$scf_schldr_8to12_pr_psql, levels = names(mapping_scf_schldr_8to12_pr_psql), labels = mapping_scf_schldr_8to12_pr_psql)

mapping_scf_attn_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_attn_13to16_pr_psql.factor = factor(data$scf_attn_13to16_pr_psql, levels = names(mapping_scf_attn_13to16_pr_psql), labels = mapping_scf_attn_13to16_pr_psql)

mapping_scf_frgt_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_frgt_13to16_pr_psql.factor = factor(data$scf_frgt_13to16_pr_psql, levels = names(mapping_scf_frgt_13to16_pr_psql), labels = mapping_scf_frgt_13to16_pr_psql)

mapping_scf_schlact_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlact_13to16_pr_psql.factor = factor(data$scf_schlact_13to16_pr_psql, levels = names(mapping_scf_schlact_13to16_pr_psql), labels = mapping_scf_schlact_13to16_pr_psql)

mapping_scf_schlfeel_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlfeel_13to16_pr_psql.factor = factor(data$scf_schlfeel_13to16_pr_psql, levels = names(mapping_scf_schlfeel_13to16_pr_psql), labels = mapping_scf_schlfeel_13to16_pr_psql)

mapping_scf_schldr_13to16_pr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schldr_13to16_pr_psql.factor = factor(data$scf_schldr_13to16_pr_psql, levels = names(mapping_scf_schldr_13to16_pr_psql), labels = mapping_scf_schldr_13to16_pr_psql)

mapping_prob_fdbk_pr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___1.factor = factor(data$prob_fdbk_pr_psql___1, levels = names(mapping_prob_fdbk_pr_psql___1), labels = mapping_prob_fdbk_pr_psql___1)

mapping_prob_fdbk_pr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___2.factor = factor(data$prob_fdbk_pr_psql___2, levels = names(mapping_prob_fdbk_pr_psql___2), labels = mapping_prob_fdbk_pr_psql___2)

mapping_prob_fdbk_pr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___3.factor = factor(data$prob_fdbk_pr_psql___3, levels = names(mapping_prob_fdbk_pr_psql___3), labels = mapping_prob_fdbk_pr_psql___3)

mapping_prob_fdbk_pr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___4.factor = factor(data$prob_fdbk_pr_psql___4, levels = names(mapping_prob_fdbk_pr_psql___4), labels = mapping_prob_fdbk_pr_psql___4)

mapping_prob_fdbk_pr_psql___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___6.factor = factor(data$prob_fdbk_pr_psql___6, levels = names(mapping_prob_fdbk_pr_psql___6), labels = mapping_prob_fdbk_pr_psql___6)

mapping_prob_fdbk_pr_psql___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___7.factor = factor(data$prob_fdbk_pr_psql___7, levels = names(mapping_prob_fdbk_pr_psql___7), labels = mapping_prob_fdbk_pr_psql___7)

mapping_prob_fdbk_pr_psql___10 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___10.factor = factor(data$prob_fdbk_pr_psql___10, levels = names(mapping_prob_fdbk_pr_psql___10), labels = mapping_prob_fdbk_pr_psql___10)

mapping_prob_fdbk_pr_psql___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___8.factor = factor(data$prob_fdbk_pr_psql___8, levels = names(mapping_prob_fdbk_pr_psql___8), labels = mapping_prob_fdbk_pr_psql___8)

mapping_prob_fdbk_pr_psql___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___98.factor = factor(data$prob_fdbk_pr_psql___98, levels = names(mapping_prob_fdbk_pr_psql___98), labels = mapping_prob_fdbk_pr_psql___98)

mapping_prob_fdbk_pr_psql___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_pr_psql___96.factor = factor(data$prob_fdbk_pr_psql___96, levels = names(mapping_prob_fdbk_pr_psql___96), labels = mapping_prob_fdbk_pr_psql___96)

mapping_time_fdbk_pr_psql = c(
	"1" = "< 30 minutes",
	"2" = "30 minutes to < 1 hour",
	"3" = "1 hour to < 2 hours",
	"4" = "2 hours to < 3 hours",
	"5" = "> 3 hours",
	"98" = "Other"
)
data$time_fdbk_pr_psql.factor = factor(data$time_fdbk_pr_psql, levels = names(mapping_time_fdbk_pr_psql), labels = mapping_time_fdbk_pr_psql)

mapping_diff_fdbk_pr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_pr_psql___1.factor = factor(data$diff_fdbk_pr_psql___1, levels = names(mapping_diff_fdbk_pr_psql___1), labels = mapping_diff_fdbk_pr_psql___1)

mapping_diff_fdbk_pr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_pr_psql___2.factor = factor(data$diff_fdbk_pr_psql___2, levels = names(mapping_diff_fdbk_pr_psql___2), labels = mapping_diff_fdbk_pr_psql___2)

mapping_diff_fdbk_pr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_pr_psql___3.factor = factor(data$diff_fdbk_pr_psql___3, levels = names(mapping_diff_fdbk_pr_psql___3), labels = mapping_diff_fdbk_pr_psql___3)

mapping_diff_fdbk_pr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_pr_psql___4.factor = factor(data$diff_fdbk_pr_psql___4, levels = names(mapping_diff_fdbk_pr_psql___4), labels = mapping_diff_fdbk_pr_psql___4)

mapping_diff_fdbk_pr_psql___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_pr_psql___96.factor = factor(data$diff_fdbk_pr_psql___96, levels = names(mapping_diff_fdbk_pr_psql___96), labels = mapping_diff_fdbk_pr_psql___96)

mapping_phys_fdbk_pr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___1.factor = factor(data$phys_fdbk_pr_psql___1, levels = names(mapping_phys_fdbk_pr_psql___1), labels = mapping_phys_fdbk_pr_psql___1)

mapping_phys_fdbk_pr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___2.factor = factor(data$phys_fdbk_pr_psql___2, levels = names(mapping_phys_fdbk_pr_psql___2), labels = mapping_phys_fdbk_pr_psql___2)

mapping_phys_fdbk_pr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___3.factor = factor(data$phys_fdbk_pr_psql___3, levels = names(mapping_phys_fdbk_pr_psql___3), labels = mapping_phys_fdbk_pr_psql___3)

mapping_phys_fdbk_pr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___4.factor = factor(data$phys_fdbk_pr_psql___4, levels = names(mapping_phys_fdbk_pr_psql___4), labels = mapping_phys_fdbk_pr_psql___4)

mapping_phys_fdbk_pr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___5.factor = factor(data$phys_fdbk_pr_psql___5, levels = names(mapping_phys_fdbk_pr_psql___5), labels = mapping_phys_fdbk_pr_psql___5)

mapping_phys_fdbk_pr_psql___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___6.factor = factor(data$phys_fdbk_pr_psql___6, levels = names(mapping_phys_fdbk_pr_psql___6), labels = mapping_phys_fdbk_pr_psql___6)

mapping_phys_fdbk_pr_psql___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___7.factor = factor(data$phys_fdbk_pr_psql___7, levels = names(mapping_phys_fdbk_pr_psql___7), labels = mapping_phys_fdbk_pr_psql___7)

mapping_phys_fdbk_pr_psql___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$phys_fdbk_pr_psql___8.factor = factor(data$phys_fdbk_pr_psql___8, levels = names(mapping_phys_fdbk_pr_psql___8), labels = mapping_phys_fdbk_pr_psql___8)

mapping_ef_fdbk_pr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_pr_psql___1.factor = factor(data$ef_fdbk_pr_psql___1, levels = names(mapping_ef_fdbk_pr_psql___1), labels = mapping_ef_fdbk_pr_psql___1)

mapping_ef_fdbk_pr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_pr_psql___2.factor = factor(data$ef_fdbk_pr_psql___2, levels = names(mapping_ef_fdbk_pr_psql___2), labels = mapping_ef_fdbk_pr_psql___2)

mapping_ef_fdbk_pr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_pr_psql___3.factor = factor(data$ef_fdbk_pr_psql___3, levels = names(mapping_ef_fdbk_pr_psql___3), labels = mapping_ef_fdbk_pr_psql___3)

mapping_ef_fdbk_pr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_pr_psql___4.factor = factor(data$ef_fdbk_pr_psql___4, levels = names(mapping_ef_fdbk_pr_psql___4), labels = mapping_ef_fdbk_pr_psql___4)

mapping_ef_fdbk_pr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_pr_psql___5.factor = factor(data$ef_fdbk_pr_psql___5, levels = names(mapping_ef_fdbk_pr_psql___5), labels = mapping_ef_fdbk_pr_psql___5)

mapping_sf_fdbk_pr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_pr_psql___1.factor = factor(data$sf_fdbk_pr_psql___1, levels = names(mapping_sf_fdbk_pr_psql___1), labels = mapping_sf_fdbk_pr_psql___1)

mapping_sf_fdbk_pr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_pr_psql___2.factor = factor(data$sf_fdbk_pr_psql___2, levels = names(mapping_sf_fdbk_pr_psql___2), labels = mapping_sf_fdbk_pr_psql___2)

mapping_sf_fdbk_pr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_pr_psql___3.factor = factor(data$sf_fdbk_pr_psql___3, levels = names(mapping_sf_fdbk_pr_psql___3), labels = mapping_sf_fdbk_pr_psql___3)

mapping_sf_fdbk_pr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_pr_psql___4.factor = factor(data$sf_fdbk_pr_psql___4, levels = names(mapping_sf_fdbk_pr_psql___4), labels = mapping_sf_fdbk_pr_psql___4)

mapping_sf_fdbk_pr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_pr_psql___5.factor = factor(data$sf_fdbk_pr_psql___5, levels = names(mapping_sf_fdbk_pr_psql___5), labels = mapping_sf_fdbk_pr_psql___5)

mapping_scf_fdbk_pr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_pr_psql___1.factor = factor(data$scf_fdbk_pr_psql___1, levels = names(mapping_scf_fdbk_pr_psql___1), labels = mapping_scf_fdbk_pr_psql___1)

mapping_scf_fdbk_pr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_pr_psql___2.factor = factor(data$scf_fdbk_pr_psql___2, levels = names(mapping_scf_fdbk_pr_psql___2), labels = mapping_scf_fdbk_pr_psql___2)

mapping_scf_fdbk_pr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_pr_psql___3.factor = factor(data$scf_fdbk_pr_psql___3, levels = names(mapping_scf_fdbk_pr_psql___3), labels = mapping_scf_fdbk_pr_psql___3)

mapping_scf_fdbk_pr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_pr_psql___4.factor = factor(data$scf_fdbk_pr_psql___4, levels = names(mapping_scf_fdbk_pr_psql___4), labels = mapping_scf_fdbk_pr_psql___4)

mapping_scf_fdbk_pr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_pr_psql___5.factor = factor(data$scf_fdbk_pr_psql___5, levels = names(mapping_scf_fdbk_pr_psql___5), labels = mapping_scf_fdbk_pr_psql___5)

mapping_agechange_psql = c(
	"0" = "This child needs the Faces Scale.",
	"1" = "This child can remain in their age-appropriate category."
)
data$agechange_psql.factor = factor(data$agechange_psql, levels = names(mapping_agechange_psql), labels = mapping_agechange_psql)

mapping_pf_walk_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_walk_5to7_sr_psql.factor = factor(data$pf_walk_5to7_sr_psql, levels = names(mapping_pf_walk_5to7_sr_psql), labels = mapping_pf_walk_5to7_sr_psql)

mapping_pf_run_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_run_5to7_sr_psql.factor = factor(data$pf_run_5to7_sr_psql, levels = names(mapping_pf_run_5to7_sr_psql), labels = mapping_pf_run_5to7_sr_psql)

mapping_pf_sprt_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_sprt_5to7_sr_psql.factor = factor(data$pf_sprt_5to7_sr_psql, levels = names(mapping_pf_sprt_5to7_sr_psql), labels = mapping_pf_sprt_5to7_sr_psql)

mapping_pf_lift_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_lift_5to7_sr_psql.factor = factor(data$pf_lift_5to7_sr_psql, levels = names(mapping_pf_lift_5to7_sr_psql), labels = mapping_pf_lift_5to7_sr_psql)

mapping_pf_bath_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_bath_5to7_sr_psql.factor = factor(data$pf_bath_5to7_sr_psql, levels = names(mapping_pf_bath_5to7_sr_psql), labels = mapping_pf_bath_5to7_sr_psql)

mapping_pf_chor_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_chor_5to7_sr_psql.factor = factor(data$pf_chor_5to7_sr_psql, levels = names(mapping_pf_chor_5to7_sr_psql), labels = mapping_pf_chor_5to7_sr_psql)

mapping_pf_hurt_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_hurt_5to7_sr_psql.factor = factor(data$pf_hurt_5to7_sr_psql, levels = names(mapping_pf_hurt_5to7_sr_psql), labels = mapping_pf_hurt_5to7_sr_psql)

mapping_pf_enrgy_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$pf_enrgy_5to7_sr_psql.factor = factor(data$pf_enrgy_5to7_sr_psql, levels = names(mapping_pf_enrgy_5to7_sr_psql), labels = mapping_pf_enrgy_5to7_sr_psql)

mapping_pf_walk_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_walk_8to12_sr_psql.factor = factor(data$pf_walk_8to12_sr_psql, levels = names(mapping_pf_walk_8to12_sr_psql), labels = mapping_pf_walk_8to12_sr_psql)

mapping_pf_run_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_run_8to12_sr_psql.factor = factor(data$pf_run_8to12_sr_psql, levels = names(mapping_pf_run_8to12_sr_psql), labels = mapping_pf_run_8to12_sr_psql)

mapping_pf_sprt_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_sprt_8to12_sr_psql.factor = factor(data$pf_sprt_8to12_sr_psql, levels = names(mapping_pf_sprt_8to12_sr_psql), labels = mapping_pf_sprt_8to12_sr_psql)

mapping_pf_lift_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_lift_8to12_sr_psql.factor = factor(data$pf_lift_8to12_sr_psql, levels = names(mapping_pf_lift_8to12_sr_psql), labels = mapping_pf_lift_8to12_sr_psql)

mapping_pf_bath_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_bath_8to12_sr_psql.factor = factor(data$pf_bath_8to12_sr_psql, levels = names(mapping_pf_bath_8to12_sr_psql), labels = mapping_pf_bath_8to12_sr_psql)

mapping_pf_chor_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_chor_8to12_sr_psql.factor = factor(data$pf_chor_8to12_sr_psql, levels = names(mapping_pf_chor_8to12_sr_psql), labels = mapping_pf_chor_8to12_sr_psql)

mapping_pf_hurt_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_hurt_8to12_sr_psql.factor = factor(data$pf_hurt_8to12_sr_psql, levels = names(mapping_pf_hurt_8to12_sr_psql), labels = mapping_pf_hurt_8to12_sr_psql)

mapping_pf_enrgy_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_enrgy_8to12_sr_psql.factor = factor(data$pf_enrgy_8to12_sr_psql, levels = names(mapping_pf_enrgy_8to12_sr_psql), labels = mapping_pf_enrgy_8to12_sr_psql)

mapping_pf_walk_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_walk_13to16_sr_psql.factor = factor(data$pf_walk_13to16_sr_psql, levels = names(mapping_pf_walk_13to16_sr_psql), labels = mapping_pf_walk_13to16_sr_psql)

mapping_pf_run_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_run_13to16_sr_psql.factor = factor(data$pf_run_13to16_sr_psql, levels = names(mapping_pf_run_13to16_sr_psql), labels = mapping_pf_run_13to16_sr_psql)

mapping_pf_sprt_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_sprt_13to16_sr_psql.factor = factor(data$pf_sprt_13to16_sr_psql, levels = names(mapping_pf_sprt_13to16_sr_psql), labels = mapping_pf_sprt_13to16_sr_psql)

mapping_pf_lift_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_lift_13to16_sr_psql.factor = factor(data$pf_lift_13to16_sr_psql, levels = names(mapping_pf_lift_13to16_sr_psql), labels = mapping_pf_lift_13to16_sr_psql)

mapping_pf_bath_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_bath_13to16_sr_psql.factor = factor(data$pf_bath_13to16_sr_psql, levels = names(mapping_pf_bath_13to16_sr_psql), labels = mapping_pf_bath_13to16_sr_psql)

mapping_pf_chor_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_chor_13to16_sr_psql.factor = factor(data$pf_chor_13to16_sr_psql, levels = names(mapping_pf_chor_13to16_sr_psql), labels = mapping_pf_chor_13to16_sr_psql)

mapping_pf_hurt_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_hurt_13to16_sr_psql.factor = factor(data$pf_hurt_13to16_sr_psql, levels = names(mapping_pf_hurt_13to16_sr_psql), labels = mapping_pf_hurt_13to16_sr_psql)

mapping_pf_enrgy_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$pf_enrgy_13to16_sr_psql.factor = factor(data$pf_enrgy_13to16_sr_psql, levels = names(mapping_pf_enrgy_13to16_sr_psql), labels = mapping_pf_enrgy_13to16_sr_psql)

mapping_ef_afrd_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$ef_afrd_5to7_sr_psql.factor = factor(data$ef_afrd_5to7_sr_psql, levels = names(mapping_ef_afrd_5to7_sr_psql), labels = mapping_ef_afrd_5to7_sr_psql)

mapping_ef_sad_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$ef_sad_5to7_sr_psql.factor = factor(data$ef_sad_5to7_sr_psql, levels = names(mapping_ef_sad_5to7_sr_psql), labels = mapping_ef_sad_5to7_sr_psql)

mapping_ef_angr_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$ef_angr_5to7_sr_psql.factor = factor(data$ef_angr_5to7_sr_psql, levels = names(mapping_ef_angr_5to7_sr_psql), labels = mapping_ef_angr_5to7_sr_psql)

mapping_ef_sleep_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$ef_sleep_5to7_sr_psql.factor = factor(data$ef_sleep_5to7_sr_psql, levels = names(mapping_ef_sleep_5to7_sr_psql), labels = mapping_ef_sleep_5to7_sr_psql)

mapping_ef_worry_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$ef_worry_5to7_sr_psql.factor = factor(data$ef_worry_5to7_sr_psql, levels = names(mapping_ef_worry_5to7_sr_psql), labels = mapping_ef_worry_5to7_sr_psql)

mapping_ef_afrd_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_afrd_8to12_sr_psql.factor = factor(data$ef_afrd_8to12_sr_psql, levels = names(mapping_ef_afrd_8to12_sr_psql), labels = mapping_ef_afrd_8to12_sr_psql)

mapping_ef_sad_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sad_8to12_sr_psql.factor = factor(data$ef_sad_8to12_sr_psql, levels = names(mapping_ef_sad_8to12_sr_psql), labels = mapping_ef_sad_8to12_sr_psql)

mapping_ef_angr_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_angr_8to12_sr_psql.factor = factor(data$ef_angr_8to12_sr_psql, levels = names(mapping_ef_angr_8to12_sr_psql), labels = mapping_ef_angr_8to12_sr_psql)

mapping_ef_sleep_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sleep_8to12_sr_psql.factor = factor(data$ef_sleep_8to12_sr_psql, levels = names(mapping_ef_sleep_8to12_sr_psql), labels = mapping_ef_sleep_8to12_sr_psql)

mapping_ef_worry_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_worry_8to12_sr_psql.factor = factor(data$ef_worry_8to12_sr_psql, levels = names(mapping_ef_worry_8to12_sr_psql), labels = mapping_ef_worry_8to12_sr_psql)

mapping_ef_afrd_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_afrd_13to16_sr_psql.factor = factor(data$ef_afrd_13to16_sr_psql, levels = names(mapping_ef_afrd_13to16_sr_psql), labels = mapping_ef_afrd_13to16_sr_psql)

mapping_ef_sad_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sad_13to16_sr_psql.factor = factor(data$ef_sad_13to16_sr_psql, levels = names(mapping_ef_sad_13to16_sr_psql), labels = mapping_ef_sad_13to16_sr_psql)

mapping_ef_angr_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_angr_13to16_sr_psql.factor = factor(data$ef_angr_13to16_sr_psql, levels = names(mapping_ef_angr_13to16_sr_psql), labels = mapping_ef_angr_13to16_sr_psql)

mapping_ef_sleep_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_sleep_13to16_sr_psql.factor = factor(data$ef_sleep_13to16_sr_psql, levels = names(mapping_ef_sleep_13to16_sr_psql), labels = mapping_ef_sleep_13to16_sr_psql)

mapping_ef_worry_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$ef_worry_13to16_sr_psql.factor = factor(data$ef_worry_13to16_sr_psql, levels = names(mapping_ef_worry_13to16_sr_psql), labels = mapping_ef_worry_13to16_sr_psql)

mapping_sf_getalong_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$sf_getalong_5to7_sr_psql.factor = factor(data$sf_getalong_5to7_sr_psql, levels = names(mapping_sf_getalong_5to7_sr_psql), labels = mapping_sf_getalong_5to7_sr_psql)

mapping_sf_nofriends_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$sf_nofriends_5to7_sr_psql.factor = factor(data$sf_nofriends_5to7_sr_psql, levels = names(mapping_sf_nofriends_5to7_sr_psql), labels = mapping_sf_nofriends_5to7_sr_psql)

mapping_sf_teas_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$sf_teas_5to7_sr_psql.factor = factor(data$sf_teas_5to7_sr_psql, levels = names(mapping_sf_teas_5to7_sr_psql), labels = mapping_sf_teas_5to7_sr_psql)

mapping_sf_notable_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$sf_notable_5to7_sr_psql.factor = factor(data$sf_notable_5to7_sr_psql, levels = names(mapping_sf_notable_5to7_sr_psql), labels = mapping_sf_notable_5to7_sr_psql)

mapping_sf_keepup_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$sf_keepup_5to7_sr_psql.factor = factor(data$sf_keepup_5to7_sr_psql, levels = names(mapping_sf_keepup_5to7_sr_psql), labels = mapping_sf_keepup_5to7_sr_psql)

mapping_sf_getalong_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_getalong_8to12_sr_psql.factor = factor(data$sf_getalong_8to12_sr_psql, levels = names(mapping_sf_getalong_8to12_sr_psql), labels = mapping_sf_getalong_8to12_sr_psql)

mapping_sf_nofriends_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_nofriends_8to12_sr_psql.factor = factor(data$sf_nofriends_8to12_sr_psql, levels = names(mapping_sf_nofriends_8to12_sr_psql), labels = mapping_sf_nofriends_8to12_sr_psql)

mapping_sf_teas_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_teas_8to12_sr_psql.factor = factor(data$sf_teas_8to12_sr_psql, levels = names(mapping_sf_teas_8to12_sr_psql), labels = mapping_sf_teas_8to12_sr_psql)

mapping_sf_notable_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_notable_8to12_sr_psql.factor = factor(data$sf_notable_8to12_sr_psql, levels = names(mapping_sf_notable_8to12_sr_psql), labels = mapping_sf_notable_8to12_sr_psql)

mapping_sf_keepingup_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_keepingup_8to12_sr_psql.factor = factor(data$sf_keepingup_8to12_sr_psql, levels = names(mapping_sf_keepingup_8to12_sr_psql), labels = mapping_sf_keepingup_8to12_sr_psql)

mapping_sf_getalong_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_getalong_13to16_sr_psql.factor = factor(data$sf_getalong_13to16_sr_psql, levels = names(mapping_sf_getalong_13to16_sr_psql), labels = mapping_sf_getalong_13to16_sr_psql)

mapping_sf_nofriends_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_nofriends_13to16_sr_psql.factor = factor(data$sf_nofriends_13to16_sr_psql, levels = names(mapping_sf_nofriends_13to16_sr_psql), labels = mapping_sf_nofriends_13to16_sr_psql)

mapping_sf_teas_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_teas_13to16_sr_psql.factor = factor(data$sf_teas_13to16_sr_psql, levels = names(mapping_sf_teas_13to16_sr_psql), labels = mapping_sf_teas_13to16_sr_psql)

mapping_sf_notable_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_notable_13to16_sr_psql.factor = factor(data$sf_notable_13to16_sr_psql, levels = names(mapping_sf_notable_13to16_sr_psql), labels = mapping_sf_notable_13to16_sr_psql)

mapping_sf_keepingup_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$sf_keepingup_13to16_sr_psql.factor = factor(data$sf_keepingup_13to16_sr_psql, levels = names(mapping_sf_keepingup_13to16_sr_psql), labels = mapping_sf_keepingup_13to16_sr_psql)

mapping_scf_attn_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$scf_attn_5to7_sr_psql.factor = factor(data$scf_attn_5to7_sr_psql, levels = names(mapping_scf_attn_5to7_sr_psql), labels = mapping_scf_attn_5to7_sr_psql)

mapping_scf_frgt_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$scf_frgt_5to7_sr_psql.factor = factor(data$scf_frgt_5to7_sr_psql, levels = names(mapping_scf_frgt_5to7_sr_psql), labels = mapping_scf_frgt_5to7_sr_psql)

mapping_scf_schlact_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$scf_schlact_5to7_sr_psql.factor = factor(data$scf_schlact_5to7_sr_psql, levels = names(mapping_scf_schlact_5to7_sr_psql), labels = mapping_scf_schlact_5to7_sr_psql)

mapping_scf_schlfeel_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$scf_schlfeel_5to7_sr_psql.factor = factor(data$scf_schlfeel_5to7_sr_psql, levels = names(mapping_scf_schlfeel_5to7_sr_psql), labels = mapping_scf_schlfeel_5to7_sr_psql)

mapping_scf_schldr_5to7_sr_psql = c(
	"100" = "0 - Not at all",
	"50" = "2 - Sometimes",
	"0" = "4 - A lot"
)
data$scf_schldr_5to7_sr_psql.factor = factor(data$scf_schldr_5to7_sr_psql, levels = names(mapping_scf_schldr_5to7_sr_psql), labels = mapping_scf_schldr_5to7_sr_psql)

mapping_scf_attn_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_attn_8to12_sr_psql.factor = factor(data$scf_attn_8to12_sr_psql, levels = names(mapping_scf_attn_8to12_sr_psql), labels = mapping_scf_attn_8to12_sr_psql)

mapping_scf_frgt_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_frgt_8to12_sr_psql.factor = factor(data$scf_frgt_8to12_sr_psql, levels = names(mapping_scf_frgt_8to12_sr_psql), labels = mapping_scf_frgt_8to12_sr_psql)

mapping_scf_schlact_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlact_8to12_sr_psql.factor = factor(data$scf_schlact_8to12_sr_psql, levels = names(mapping_scf_schlact_8to12_sr_psql), labels = mapping_scf_schlact_8to12_sr_psql)

mapping_scf_schlfeel_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlfeel_8to12_sr_psql.factor = factor(data$scf_schlfeel_8to12_sr_psql, levels = names(mapping_scf_schlfeel_8to12_sr_psql), labels = mapping_scf_schlfeel_8to12_sr_psql)

mapping_scf_schldr_8to12_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schldr_8to12_sr_psql.factor = factor(data$scf_schldr_8to12_sr_psql, levels = names(mapping_scf_schldr_8to12_sr_psql), labels = mapping_scf_schldr_8to12_sr_psql)

mapping_scf_attn_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_attn_13to16_sr_psql.factor = factor(data$scf_attn_13to16_sr_psql, levels = names(mapping_scf_attn_13to16_sr_psql), labels = mapping_scf_attn_13to16_sr_psql)

mapping_scf_frgt_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_frgt_13to16_sr_psql.factor = factor(data$scf_frgt_13to16_sr_psql, levels = names(mapping_scf_frgt_13to16_sr_psql), labels = mapping_scf_frgt_13to16_sr_psql)

mapping_scf_schlact_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlact_13to16_sr_psql.factor = factor(data$scf_schlact_13to16_sr_psql, levels = names(mapping_scf_schlact_13to16_sr_psql), labels = mapping_scf_schlact_13to16_sr_psql)

mapping_scf_schlfeel_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schlfeel_13to16_sr_psql.factor = factor(data$scf_schlfeel_13to16_sr_psql, levels = names(mapping_scf_schlfeel_13to16_sr_psql), labels = mapping_scf_schlfeel_13to16_sr_psql)

mapping_scf_schldr_13to16_sr_psql = c(
	"100" = "0 - Never",
	"75" = "1 - Almost Never",
	"50" = "2 - Sometimes",
	"25" = "3 - Often",
	"0" = "4 - Almost Always"
)
data$scf_schldr_13to16_sr_psql.factor = factor(data$scf_schldr_13to16_sr_psql, levels = names(mapping_scf_schldr_13to16_sr_psql), labels = mapping_scf_schldr_13to16_sr_psql)

mapping_prob_fdbk_sr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___1.factor = factor(data$prob_fdbk_sr_psql___1, levels = names(mapping_prob_fdbk_sr_psql___1), labels = mapping_prob_fdbk_sr_psql___1)

mapping_prob_fdbk_sr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___2.factor = factor(data$prob_fdbk_sr_psql___2, levels = names(mapping_prob_fdbk_sr_psql___2), labels = mapping_prob_fdbk_sr_psql___2)

mapping_prob_fdbk_sr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___3.factor = factor(data$prob_fdbk_sr_psql___3, levels = names(mapping_prob_fdbk_sr_psql___3), labels = mapping_prob_fdbk_sr_psql___3)

mapping_prob_fdbk_sr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___4.factor = factor(data$prob_fdbk_sr_psql___4, levels = names(mapping_prob_fdbk_sr_psql___4), labels = mapping_prob_fdbk_sr_psql___4)

mapping_prob_fdbk_sr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___5.factor = factor(data$prob_fdbk_sr_psql___5, levels = names(mapping_prob_fdbk_sr_psql___5), labels = mapping_prob_fdbk_sr_psql___5)

mapping_prob_fdbk_sr_psql___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___9.factor = factor(data$prob_fdbk_sr_psql___9, levels = names(mapping_prob_fdbk_sr_psql___9), labels = mapping_prob_fdbk_sr_psql___9)

mapping_prob_fdbk_sr_psql___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___6.factor = factor(data$prob_fdbk_sr_psql___6, levels = names(mapping_prob_fdbk_sr_psql___6), labels = mapping_prob_fdbk_sr_psql___6)

mapping_prob_fdbk_sr_psql___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___7.factor = factor(data$prob_fdbk_sr_psql___7, levels = names(mapping_prob_fdbk_sr_psql___7), labels = mapping_prob_fdbk_sr_psql___7)

mapping_prob_fdbk_sr_psql___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___8.factor = factor(data$prob_fdbk_sr_psql___8, levels = names(mapping_prob_fdbk_sr_psql___8), labels = mapping_prob_fdbk_sr_psql___8)

mapping_prob_fdbk_sr_psql___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___98.factor = factor(data$prob_fdbk_sr_psql___98, levels = names(mapping_prob_fdbk_sr_psql___98), labels = mapping_prob_fdbk_sr_psql___98)

mapping_prob_fdbk_sr_psql___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$prob_fdbk_sr_psql___96.factor = factor(data$prob_fdbk_sr_psql___96, levels = names(mapping_prob_fdbk_sr_psql___96), labels = mapping_prob_fdbk_sr_psql___96)

mapping_time_fdbk_sr_psql = c(
	"1" = "< 30 minutes",
	"2" = "30 minutes to < 1 hour",
	"3" = "1 hour to < 2 hours",
	"4" = "2 hours to < 3 hours",
	"5" = "> 3 hours",
	"98" = "Other"
)
data$time_fdbk_sr_psql.factor = factor(data$time_fdbk_sr_psql, levels = names(mapping_time_fdbk_sr_psql), labels = mapping_time_fdbk_sr_psql)

mapping_diff_fdbk_sr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_sr_psql___1.factor = factor(data$diff_fdbk_sr_psql___1, levels = names(mapping_diff_fdbk_sr_psql___1), labels = mapping_diff_fdbk_sr_psql___1)

mapping_diff_fdbk_sr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_sr_psql___2.factor = factor(data$diff_fdbk_sr_psql___2, levels = names(mapping_diff_fdbk_sr_psql___2), labels = mapping_diff_fdbk_sr_psql___2)

mapping_diff_fdbk_sr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_sr_psql___3.factor = factor(data$diff_fdbk_sr_psql___3, levels = names(mapping_diff_fdbk_sr_psql___3), labels = mapping_diff_fdbk_sr_psql___3)

mapping_diff_fdbk_sr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_sr_psql___4.factor = factor(data$diff_fdbk_sr_psql___4, levels = names(mapping_diff_fdbk_sr_psql___4), labels = mapping_diff_fdbk_sr_psql___4)

mapping_diff_fdbk_sr_psql___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diff_fdbk_sr_psql___96.factor = factor(data$diff_fdbk_sr_psql___96, levels = names(mapping_diff_fdbk_sr_psql___96), labels = mapping_diff_fdbk_sr_psql___96)

mapping_pf_fdbk_sr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___1.factor = factor(data$pf_fdbk_sr_psql___1, levels = names(mapping_pf_fdbk_sr_psql___1), labels = mapping_pf_fdbk_sr_psql___1)

mapping_pf_fdbk_sr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___2.factor = factor(data$pf_fdbk_sr_psql___2, levels = names(mapping_pf_fdbk_sr_psql___2), labels = mapping_pf_fdbk_sr_psql___2)

mapping_pf_fdbk_sr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___3.factor = factor(data$pf_fdbk_sr_psql___3, levels = names(mapping_pf_fdbk_sr_psql___3), labels = mapping_pf_fdbk_sr_psql___3)

mapping_pf_fdbk_sr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___4.factor = factor(data$pf_fdbk_sr_psql___4, levels = names(mapping_pf_fdbk_sr_psql___4), labels = mapping_pf_fdbk_sr_psql___4)

mapping_pf_fdbk_sr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___5.factor = factor(data$pf_fdbk_sr_psql___5, levels = names(mapping_pf_fdbk_sr_psql___5), labels = mapping_pf_fdbk_sr_psql___5)

mapping_pf_fdbk_sr_psql___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___6.factor = factor(data$pf_fdbk_sr_psql___6, levels = names(mapping_pf_fdbk_sr_psql___6), labels = mapping_pf_fdbk_sr_psql___6)

mapping_pf_fdbk_sr_psql___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___7.factor = factor(data$pf_fdbk_sr_psql___7, levels = names(mapping_pf_fdbk_sr_psql___7), labels = mapping_pf_fdbk_sr_psql___7)

mapping_pf_fdbk_sr_psql___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pf_fdbk_sr_psql___8.factor = factor(data$pf_fdbk_sr_psql___8, levels = names(mapping_pf_fdbk_sr_psql___8), labels = mapping_pf_fdbk_sr_psql___8)

mapping_ef_fdbk_sr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_sr_psql___1.factor = factor(data$ef_fdbk_sr_psql___1, levels = names(mapping_ef_fdbk_sr_psql___1), labels = mapping_ef_fdbk_sr_psql___1)

mapping_ef_fdbk_sr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_sr_psql___2.factor = factor(data$ef_fdbk_sr_psql___2, levels = names(mapping_ef_fdbk_sr_psql___2), labels = mapping_ef_fdbk_sr_psql___2)

mapping_ef_fdbk_sr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_sr_psql___3.factor = factor(data$ef_fdbk_sr_psql___3, levels = names(mapping_ef_fdbk_sr_psql___3), labels = mapping_ef_fdbk_sr_psql___3)

mapping_ef_fdbk_sr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_sr_psql___4.factor = factor(data$ef_fdbk_sr_psql___4, levels = names(mapping_ef_fdbk_sr_psql___4), labels = mapping_ef_fdbk_sr_psql___4)

mapping_ef_fdbk_sr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$ef_fdbk_sr_psql___5.factor = factor(data$ef_fdbk_sr_psql___5, levels = names(mapping_ef_fdbk_sr_psql___5), labels = mapping_ef_fdbk_sr_psql___5)

mapping_sf_fdbk_sr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_sr_psql___1.factor = factor(data$sf_fdbk_sr_psql___1, levels = names(mapping_sf_fdbk_sr_psql___1), labels = mapping_sf_fdbk_sr_psql___1)

mapping_sf_fdbk_sr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_sr_psql___2.factor = factor(data$sf_fdbk_sr_psql___2, levels = names(mapping_sf_fdbk_sr_psql___2), labels = mapping_sf_fdbk_sr_psql___2)

mapping_sf_fdbk_sr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_sr_psql___3.factor = factor(data$sf_fdbk_sr_psql___3, levels = names(mapping_sf_fdbk_sr_psql___3), labels = mapping_sf_fdbk_sr_psql___3)

mapping_sf_fdbk_sr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_sr_psql___4.factor = factor(data$sf_fdbk_sr_psql___4, levels = names(mapping_sf_fdbk_sr_psql___4), labels = mapping_sf_fdbk_sr_psql___4)

mapping_sf_fdbk_sr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$sf_fdbk_sr_psql___5.factor = factor(data$sf_fdbk_sr_psql___5, levels = names(mapping_sf_fdbk_sr_psql___5), labels = mapping_sf_fdbk_sr_psql___5)

mapping_scf_fdbk_sr_psql___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_sr_psql___1.factor = factor(data$scf_fdbk_sr_psql___1, levels = names(mapping_scf_fdbk_sr_psql___1), labels = mapping_scf_fdbk_sr_psql___1)

mapping_scf_fdbk_sr_psql___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_sr_psql___2.factor = factor(data$scf_fdbk_sr_psql___2, levels = names(mapping_scf_fdbk_sr_psql___2), labels = mapping_scf_fdbk_sr_psql___2)

mapping_scf_fdbk_sr_psql___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_sr_psql___3.factor = factor(data$scf_fdbk_sr_psql___3, levels = names(mapping_scf_fdbk_sr_psql___3), labels = mapping_scf_fdbk_sr_psql___3)

mapping_scf_fdbk_sr_psql___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_sr_psql___4.factor = factor(data$scf_fdbk_sr_psql___4, levels = names(mapping_scf_fdbk_sr_psql___4), labels = mapping_scf_fdbk_sr_psql___4)

mapping_scf_fdbk_sr_psql___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$scf_fdbk_sr_psql___5.factor = factor(data$scf_fdbk_sr_psql___5, levels = names(mapping_scf_fdbk_sr_psql___5), labels = mapping_scf_fdbk_sr_psql___5)

mapping_fss_and_pedsql_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$fss_and_pedsql_complete.factor = factor(data$fss_and_pedsql_complete, levels = names(mapping_fss_and_pedsql_complete), labels = mapping_fss_and_pedsql_complete)

mapping_dischampm_dis = c(
	"1" = "AM",
	"2" = "PM"
)
data$dischampm_dis.factor = factor(data$dischampm_dis, levels = names(mapping_dischampm_dis), labels = mapping_dischampm_dis)

mapping_nursename_dis = c(
	"1" = "Christine",
	"2" = "Rabecca",
	"3" = "Harriet",
	"24" = "Mackline",
	"20" = "Mildred",
	"21" = "Phionah",
	"4" = "Mary",
	"5" = "Zorah",
	"6" = "Maliza",
	"7" = "Bosco",
	"8" = "Abibu",
	"9" = "Emerthe",
	"10" = "Juliette",
	"11" = "Alphonsine",
	"12" = "Marie Chantal",
	"13" = "Sandrine",
	"14" = "Vestine",
	"15" = "Amisa",
	"16" = "Joan",
	"17" = "Emmanuel",
	"18" = "Prisca",
	"19" = "Sia",
	"22" = "Vanessa",
	"23" = "Jackline",
	"25" = "Farida",
	"26" = "Macrina",
	"98" = "Other"
)
data$nursename_dis.factor = factor(data$nursename_dis, levels = names(mapping_nursename_dis), labels = mapping_nursename_dis)

mapping_death_dis = c(
	"1" = "Yes",
	"0" = "No"
)
data$death_dis.factor = factor(data$death_dis, levels = names(mapping_death_dis), labels = mapping_death_dis)

mapping_dischstatus_dis = c(
	"1" = "Referred to higher level of care",
	"2" = "Routine discharge",
	"3" = "Discharged against medical advice",
	"4" = "Fled/escaped"
)
data$dischstatus_dis.factor = factor(data$dischstatus_dis, levels = names(mapping_dischstatus_dis), labels = mapping_dischstatus_dis)

mapping_referralplace_dis = c(
	"1" = "Mbarara RRH",
	"2" = "Holy Innocents Childrens Hospital",
	"3" = "Jinja Regional Referral Hospital",
	"4" = "University Teaching Hospital of Kigali",
	"5" = "Ruhengeri Referral Hospital",
	"6" = "Muhimbili National Hospital",
	"7" = "Bugando Medical Center",
	"8" = "Mulago National Referral Hospital",
	"9" = "University Teaching Hospital of Butare",
	"10" = "Rwanda Military Hospital",
	"11" = "King Faysal Hospital",
	"12" = "Whispers Hospital",
	"13" = "Nile International",
	"15" = "Masaka Hospital",
	"96" = "Other private hospital",
	"98" = "Other public hospital"
)
data$referralplace_dis.factor = factor(data$referralplace_dis, levels = names(mapping_referralplace_dis), labels = mapping_referralplace_dis)

mapping_damareason_dis___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___1.factor = factor(data$damareason_dis___1, levels = names(mapping_damareason_dis___1), labels = mapping_damareason_dis___1)

mapping_damareason_dis___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___2.factor = factor(data$damareason_dis___2, levels = names(mapping_damareason_dis___2), labels = mapping_damareason_dis___2)

mapping_damareason_dis___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___3.factor = factor(data$damareason_dis___3, levels = names(mapping_damareason_dis___3), labels = mapping_damareason_dis___3)

mapping_damareason_dis___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___4.factor = factor(data$damareason_dis___4, levels = names(mapping_damareason_dis___4), labels = mapping_damareason_dis___4)

mapping_damareason_dis___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___5.factor = factor(data$damareason_dis___5, levels = names(mapping_damareason_dis___5), labels = mapping_damareason_dis___5)

mapping_damareason_dis___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___6.factor = factor(data$damareason_dis___6, levels = names(mapping_damareason_dis___6), labels = mapping_damareason_dis___6)

mapping_damareason_dis___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___7.factor = factor(data$damareason_dis___7, levels = names(mapping_damareason_dis___7), labels = mapping_damareason_dis___7)

mapping_damareason_dis___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___8.factor = factor(data$damareason_dis___8, levels = names(mapping_damareason_dis___8), labels = mapping_damareason_dis___8)

mapping_damareason_dis___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___97.factor = factor(data$damareason_dis___97, levels = names(mapping_damareason_dis___97), labels = mapping_damareason_dis___97)

mapping_damareason_dis___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dis___98.factor = factor(data$damareason_dis___98, levels = names(mapping_damareason_dis___98), labels = mapping_damareason_dis___98)

mapping_diagnosis_dis___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___1.factor = factor(data$diagnosis_dis___1, levels = names(mapping_diagnosis_dis___1), labels = mapping_diagnosis_dis___1)

mapping_diagnosis_dis___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___2.factor = factor(data$diagnosis_dis___2, levels = names(mapping_diagnosis_dis___2), labels = mapping_diagnosis_dis___2)

mapping_diagnosis_dis___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___3.factor = factor(data$diagnosis_dis___3, levels = names(mapping_diagnosis_dis___3), labels = mapping_diagnosis_dis___3)

mapping_diagnosis_dis___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___4.factor = factor(data$diagnosis_dis___4, levels = names(mapping_diagnosis_dis___4), labels = mapping_diagnosis_dis___4)

mapping_diagnosis_dis___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___5.factor = factor(data$diagnosis_dis___5, levels = names(mapping_diagnosis_dis___5), labels = mapping_diagnosis_dis___5)

mapping_diagnosis_dis___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___6.factor = factor(data$diagnosis_dis___6, levels = names(mapping_diagnosis_dis___6), labels = mapping_diagnosis_dis___6)

mapping_diagnosis_dis___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___7.factor = factor(data$diagnosis_dis___7, levels = names(mapping_diagnosis_dis___7), labels = mapping_diagnosis_dis___7)

mapping_diagnosis_dis___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___8.factor = factor(data$diagnosis_dis___8, levels = names(mapping_diagnosis_dis___8), labels = mapping_diagnosis_dis___8)

mapping_diagnosis_dis___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___9.factor = factor(data$diagnosis_dis___9, levels = names(mapping_diagnosis_dis___9), labels = mapping_diagnosis_dis___9)

mapping_diagnosis_dis___10 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___10.factor = factor(data$diagnosis_dis___10, levels = names(mapping_diagnosis_dis___10), labels = mapping_diagnosis_dis___10)

mapping_diagnosis_dis___11 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___11.factor = factor(data$diagnosis_dis___11, levels = names(mapping_diagnosis_dis___11), labels = mapping_diagnosis_dis___11)

mapping_diagnosis_dis___12 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___12.factor = factor(data$diagnosis_dis___12, levels = names(mapping_diagnosis_dis___12), labels = mapping_diagnosis_dis___12)

mapping_diagnosis_dis___13 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___13.factor = factor(data$diagnosis_dis___13, levels = names(mapping_diagnosis_dis___13), labels = mapping_diagnosis_dis___13)

mapping_diagnosis_dis___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$diagnosis_dis___98.factor = factor(data$diagnosis_dis___98, levels = names(mapping_diagnosis_dis___98), labels = mapping_diagnosis_dis___98)

mapping_icu_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$icu_dis.factor = factor(data$icu_dis, levels = names(mapping_icu_dis), labels = mapping_icu_dis)

mapping_resp_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$resp_dis.factor = factor(data$resp_dis, levels = names(mapping_resp_dis), labels = mapping_resp_dis)

mapping_respinterv_dis___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$respinterv_dis___1.factor = factor(data$respinterv_dis___1, levels = names(mapping_respinterv_dis___1), labels = mapping_respinterv_dis___1)

mapping_respinterv_dis___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$respinterv_dis___2.factor = factor(data$respinterv_dis___2, levels = names(mapping_respinterv_dis___2), labels = mapping_respinterv_dis___2)

mapping_respinterv_dis___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$respinterv_dis___3.factor = factor(data$respinterv_dis___3, levels = names(mapping_respinterv_dis___3), labels = mapping_respinterv_dis___3)

mapping_dialysis_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$dialysis_dis.factor = factor(data$dialysis_dis, levels = names(mapping_dialysis_dis), labels = mapping_dialysis_dis)

mapping_steroids_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$steroids_dis.factor = factor(data$steroids_dis, levels = names(mapping_steroids_dis), labels = mapping_steroids_dis)

mapping_transfusion_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$transfusion_dis.factor = factor(data$transfusion_dis, levels = names(mapping_transfusion_dis), labels = mapping_transfusion_dis)

mapping_feedingstatus_dis = c(
	"1" = "Feeding well",
	"2" = "Feeding poorly",
	"3" = "Not feeding at all",
	"97" = "Dont know"
)
data$feedingstatus_dis.factor = factor(data$feedingstatus_dis, levels = names(mapping_feedingstatus_dis), labels = mapping_feedingstatus_dis)

mapping_concern_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$concern_dis.factor = factor(data$concern_dis, levels = names(mapping_concern_dis), labels = mapping_concern_dis)

mapping_concernrecov_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$concernrecov_dis.factor = factor(data$concernrecov_dis, levels = names(mapping_concernrecov_dis), labels = mapping_concernrecov_dis)

mapping_concernsick_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$concernsick_dis.factor = factor(data$concernsick_dis, levels = names(mapping_concernsick_dis), labels = mapping_concernsick_dis)

mapping_concerncare_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$concerncare_dis.factor = factor(data$concerncare_dis, levels = names(mapping_concerncare_dis), labels = mapping_concerncare_dis)

mapping_concernresourc_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$concernresourc_dis.factor = factor(data$concernresourc_dis, levels = names(mapping_concernresourc_dis), labels = mapping_concernresourc_dis)

mapping_concernother_dis = c(
	"1" = "Yes",
	"0" = "No"
)
data$concernother_dis.factor = factor(data$concernother_dis, levels = names(mapping_concernother_dis), labels = mapping_concernother_dis)

mapping_tradhealer_dis = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$tradhealer_dis.factor = factor(data$tradhealer_dis, levels = names(mapping_tradhealer_dis), labels = mapping_tradhealer_dis)

mapping_discharge_variables_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$discharge_variables_complete.factor = factor(data$discharge_variables_complete, levels = names(mapping_discharge_variables_complete), labels = mapping_discharge_variables_complete)

mapping_transfersuccess_ref = c(
	"1" = "Yes",
	"0" = "No"
)
data$transfersuccess_ref.factor = factor(data$transfersuccess_ref, levels = names(mapping_transfersuccess_ref), labels = mapping_transfersuccess_ref)

mapping_transferfail_ref = c(
	"1" = "Died on the way",
	"2" = "Refused transfer",
	"98" = "Other"
)
data$transferfail_ref.factor = factor(data$transferfail_ref, levels = names(mapping_transferfail_ref), labels = mapping_transferfail_ref)

mapping_transfersite_ref = c(
	"1" = "Mbarara RRH",
	"2" = "Holy Innocents Childrens Hospital",
	"3" = "Jinja Regional Referral Hospital",
	"4" = "University Teaching Hospital of Kigali",
	"5" = "Ruhengeri Referral Hospital",
	"6" = "Muhimbili National Hospital",
	"7" = "Bugando Medical Center",
	"8" = "Mulago National Referral Hospital",
	"9" = "University Teaching Hospital of Butare",
	"10" = "Rwanda Military Hospital",
	"11" = "King Faysal Hospital",
	"12" = "Whispers Hospital",
	"13" = "Nile International",
	"15" = "Masaka Hospital",
	"96" = "Other private hospital",
	"98" = "Other public hospital"
)
data$transfersite_ref.factor = factor(data$transfersite_ref, levels = names(mapping_transfersite_ref), labels = mapping_transfersite_ref)

mapping_outcome_ref = c(
	"1" = "Admission",
	"2" = "Sent home",
	"3" = "Refused admission",
	"98" = "Other"
)
data$outcome_ref.factor = factor(data$outcome_ref, levels = names(mapping_outcome_ref), labels = mapping_outcome_ref)

mapping_admissionoutcome_ref = c(
	"1" = "Died",
	"2" = "Routine discharge",
	"3" = "Discharge against medical advice",
	"4" = "Referral elsewhere"
)
data$admissionoutcome_ref.factor = factor(data$admissionoutcome_ref, levels = names(mapping_admissionoutcome_ref), labels = mapping_admissionoutcome_ref)

mapping_referral_variables_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$referral_variables_complete.factor = factor(data$referral_variables_complete, levels = names(mapping_referral_variables_complete), labels = mapping_referral_variables_complete)

mapping_damareason_dama___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___1.factor = factor(data$damareason_dama___1, levels = names(mapping_damareason_dama___1), labels = mapping_damareason_dama___1)

mapping_damareason_dama___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___2.factor = factor(data$damareason_dama___2, levels = names(mapping_damareason_dama___2), labels = mapping_damareason_dama___2)

mapping_damareason_dama___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___3.factor = factor(data$damareason_dama___3, levels = names(mapping_damareason_dama___3), labels = mapping_damareason_dama___3)

mapping_damareason_dama___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___4.factor = factor(data$damareason_dama___4, levels = names(mapping_damareason_dama___4), labels = mapping_damareason_dama___4)

mapping_damareason_dama___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___5.factor = factor(data$damareason_dama___5, levels = names(mapping_damareason_dama___5), labels = mapping_damareason_dama___5)

mapping_damareason_dama___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___6.factor = factor(data$damareason_dama___6, levels = names(mapping_damareason_dama___6), labels = mapping_damareason_dama___6)

mapping_damareason_dama___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___7.factor = factor(data$damareason_dama___7, levels = names(mapping_damareason_dama___7), labels = mapping_damareason_dama___7)

mapping_damareason_dama___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___8.factor = factor(data$damareason_dama___8, levels = names(mapping_damareason_dama___8), labels = mapping_damareason_dama___8)

mapping_damareason_dama___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___97.factor = factor(data$damareason_dama___97, levels = names(mapping_damareason_dama___97), labels = mapping_damareason_dama___97)

mapping_damareason_dama___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$damareason_dama___98.factor = factor(data$damareason_dama___98, levels = names(mapping_damareason_dama___98), labels = mapping_damareason_dama___98)

mapping_dama_variables_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$dama_variables_complete.factor = factor(data$dama_variables_complete, levels = names(mapping_dama_variables_complete), labels = mapping_dama_variables_complete)

mapping_lost_followup = c(
	"1" = "Yes",
	"0" = "No"
)
data$lost_followup.factor = factor(data$lost_followup, levels = names(mapping_lost_followup), labels = mapping_lost_followup)

mapping_lost_to_followup_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$lost_to_followup_complete.factor = factor(data$lost_to_followup_complete, levels = names(mapping_lost_to_followup_complete), labels = mapping_lost_to_followup_complete)

mapping_followtype_fol = c(
	"1" = "Phone",
	"2" = "In-person"
)
data$followtype_fol.factor = factor(data$followtype_fol, levels = names(mapping_followtype_fol), labels = mapping_followtype_fol)

mapping_location_fol = c(
	"1" = "Patients home or nearby",
	"2" = "Patients school",
	"98" = "Other"
)
data$location_fol.factor = factor(data$location_fol, levels = names(mapping_location_fol), labels = mapping_location_fol)

mapping_interviewee_fol = c(
	"1" = "Biological parent",
	"2" = "Grandparent",
	"3" = "Sibling",
	"4" = "Aunt / uncle / cousin",
	"5" = "Stepmother / stepfather",
	"6" = "Care home / orphanage",
	"7" = "School staff",
	"98" = "Other"
)
data$interviewee_fol.factor = factor(data$interviewee_fol, levels = names(mapping_interviewee_fol), labels = mapping_interviewee_fol)

mapping_intervieweesex_fol = c(
	"1" = "Female",
	"2" = "Male",
	"99" = "N/A (in care)"
)
data$intervieweesex_fol.factor = factor(data$intervieweesex_fol, levels = names(mapping_intervieweesex_fol), labels = mapping_intervieweesex_fol)

mapping_intervieweeage_fol = c(
	"1" = "< 19 years",
	"2" = "19 years to < 51 years",
	"3" = "51 years or older",
	"99" = "N/A (in care)"
)
data$intervieweeage_fol.factor = factor(data$intervieweeage_fol, levels = names(mapping_intervieweeage_fol), labels = mapping_intervieweeage_fol)

mapping_isprimarycaregiver_fol = c(
	"1" = "Yes",
	"0" = "No"
)
data$isprimarycaregiver_fol.factor = factor(data$isprimarycaregiver_fol, levels = names(mapping_isprimarycaregiver_fol), labels = mapping_isprimarycaregiver_fol)

mapping_healthstatus_fol = c(
	"1" = "Appears normal",
	"2" = "Recovering (not yet back to normal)",
	"3" = "Appears worse",
	"96" = "Child died"
)
data$healthstatus_fol.factor = factor(data$healthstatus_fol, levels = names(mapping_healthstatus_fol), labels = mapping_healthstatus_fol)

mapping_pdddateknown_fol = c(
	"1" = "Yes",
	"0" = "No"
)
data$pdddateknown_fol.factor = factor(data$pdddateknown_fol, levels = names(mapping_pdddateknown_fol), labels = mapping_pdddateknown_fol)

mapping_pddcaregiverpresent_fol = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Unknown"
)
data$pddcaregiverpresent_fol.factor = factor(data$pddcaregiverpresent_fol, levels = names(mapping_pddcaregiverpresent_fol), labels = mapping_pddcaregiverpresent_fol)

mapping_pddloc_fol = c(
	"1" = "At home",
	"2" = "At the home of a relative/friend",
	"3" = "On the way to seeking care (anytime prior to actual treatment)",
	"4" = "At hospital/health center (anytime after treatment initiated)",
	"97" = "Dont know"
)
data$pddloc_fol.factor = factor(data$pddloc_fol, levels = names(mapping_pddloc_fol), labels = mapping_pddloc_fol)

mapping_pddcaresought_fol = c(
	"1" = "Yes - once",
	"2" = "Yes - more than once",
	"3" = "No - child died before care was sought"
)
data$pddcaresought_fol.factor = factor(data$pddcaresought_fol, levels = names(mapping_pddcaresought_fol), labels = mapping_pddcaresought_fol)

mapping_pddcaresource_fol = c(
	"1" = "Self referral",
	"3" = "Referral from other healthcare facility",
	"97" = "Dont know",
	"96" = "Other scheduled follow-up visit"
)
data$pddcaresource_fol.factor = factor(data$pddcaresource_fol, levels = names(mapping_pddcaresource_fol), labels = mapping_pddcaresource_fol)

mapping_pddcaretype_fol___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pddcaretype_fol___1.factor = factor(data$pddcaretype_fol___1, levels = names(mapping_pddcaretype_fol___1), labels = mapping_pddcaretype_fol___1)

mapping_pddcaretype_fol___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pddcaretype_fol___2.factor = factor(data$pddcaretype_fol___2, levels = names(mapping_pddcaretype_fol___2), labels = mapping_pddcaretype_fol___2)

mapping_pddcaretype_fol___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pddcaretype_fol___3.factor = factor(data$pddcaretype_fol___3, levels = names(mapping_pddcaretype_fol___3), labels = mapping_pddcaretype_fol___3)

mapping_pddcaretype_fol___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pddcaretype_fol___4.factor = factor(data$pddcaretype_fol___4, levels = names(mapping_pddcaretype_fol___4), labels = mapping_pddcaretype_fol___4)

mapping_pddcaretype_fol___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$pddcaretype_fol___5.factor = factor(data$pddcaretype_fol___5, levels = names(mapping_pddcaretype_fol___5), labels = mapping_pddcaretype_fol___5)

mapping_pdrehosp_fol = c(
	"1" = "Yes",
	"0" = "No"
)
data$pdrehosp_fol.factor = factor(data$pdrehosp_fol, levels = names(mapping_pdrehosp_fol), labels = mapping_pdrehosp_fol)

mapping_pdrehospnum_fol = c(
	"1" = "Once",
	"2" = "Twice",
	"3" = "More than twice"
)
data$pdrehospnum_fol.factor = factor(data$pdrehospnum_fol, levels = names(mapping_pdrehospnum_fol), labels = mapping_pdrehospnum_fol)

mapping_pdrehospplace1_fol = c(
	"1" = "Mbarara RRH",
	"2" = "Holy Innocents Childrens Hospital",
	"3" = "Jinja Regional Referral Hospital",
	"4" = "University Teaching Hospital of Kigali",
	"5" = "Ruhengeri Referral Hospital",
	"6" = "Bugando Medical Center",
	"7" = "Sekou-Toure Regional Hospital",
	"8" = "Mulago National Referral Hospital",
	"9" = "University Teaching Hospital of Butare",
	"10" = "Rwanda Military Hospital",
	"11" = "King Faysal Hospital",
	"12" = "Whispers Hospital",
	"13" = "Nile International",
	"14" = "Uganda Martyrs Ibanda Hospital",
	"15" = "Masaka Hospital",
	"96" = "Other private hospital",
	"98" = "Other public hospital"
)
data$pdrehospplace1_fol.factor = factor(data$pdrehospplace1_fol, levels = names(mapping_pdrehospplace1_fol), labels = mapping_pdrehospplace1_fol)

mapping_pdrehospsource1_fol = c(
	"1" = "Self referral",
	"3" = "Referral from other healthcare facility",
	"97" = "Dont know"
)
data$pdrehospsource1_fol.factor = factor(data$pdrehospsource1_fol, levels = names(mapping_pdrehospsource1_fol), labels = mapping_pdrehospsource1_fol)

mapping_pdrehospplace2_fol = c(
	"1" = "Mbarara RRH",
	"2" = "Holy Innocents Childrens Hospital",
	"3" = "Jinja Regional Referral Hospital",
	"4" = "University Teaching Hospital of Kigali",
	"5" = "Ruhengeri Referral Hospital",
	"6" = "Bugando Medical Center",
	"7" = "Sekou-Toure Regional Hospital",
	"8" = "Mulago National Referral Hospital",
	"9" = "University Teaching Hospital of Butare",
	"10" = "Rwanda Military Hospital",
	"11" = "King Faysal Hospital",
	"12" = "Whispers Hospital",
	"13" = "Nile International",
	"14" = "Uganda Martyrs Ibanda Hospital",
	"15" = "Masaka Hospital",
	"96" = "Other private hospital",
	"98" = "Other public hospital"
)
data$pdrehospplace2_fol.factor = factor(data$pdrehospplace2_fol, levels = names(mapping_pdrehospplace2_fol), labels = mapping_pdrehospplace2_fol)

mapping_pdrehospsource2_fol = c(
	"1" = "Self referral",
	"3" = "Referral from other healthcare facility",
	"97" = "Dont know"
)
data$pdrehospsource2_fol.factor = factor(data$pdrehospsource2_fol, levels = names(mapping_pdrehospsource2_fol), labels = mapping_pdrehospsource2_fol)

mapping_internetuse_fol = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$internetuse_fol.factor = factor(data$internetuse_fol, levels = names(mapping_internetuse_fol), labels = mapping_internetuse_fol)

mapping_otherstudy_fol = c(
	"1" = "Yes",
	"0" = "No"
)
data$otherstudy_fol.factor = factor(data$otherstudy_fol, levels = names(mapping_otherstudy_fol), labels = mapping_otherstudy_fol)

mapping_otherstudy_selection_fol___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___1.factor = factor(data$otherstudy_selection_fol___1, levels = names(mapping_otherstudy_selection_fol___1), labels = mapping_otherstudy_selection_fol___1)

mapping_otherstudy_selection_fol___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___2.factor = factor(data$otherstudy_selection_fol___2, levels = names(mapping_otherstudy_selection_fol___2), labels = mapping_otherstudy_selection_fol___2)

mapping_otherstudy_selection_fol___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___3.factor = factor(data$otherstudy_selection_fol___3, levels = names(mapping_otherstudy_selection_fol___3), labels = mapping_otherstudy_selection_fol___3)

mapping_otherstudy_selection_fol___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___4.factor = factor(data$otherstudy_selection_fol___4, levels = names(mapping_otherstudy_selection_fol___4), labels = mapping_otherstudy_selection_fol___4)

mapping_otherstudy_selection_fol___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___5.factor = factor(data$otherstudy_selection_fol___5, levels = names(mapping_otherstudy_selection_fol___5), labels = mapping_otherstudy_selection_fol___5)

mapping_otherstudy_selection_fol___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___6.factor = factor(data$otherstudy_selection_fol___6, levels = names(mapping_otherstudy_selection_fol___6), labels = mapping_otherstudy_selection_fol___6)

mapping_otherstudy_selection_fol___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___7.factor = factor(data$otherstudy_selection_fol___7, levels = names(mapping_otherstudy_selection_fol___7), labels = mapping_otherstudy_selection_fol___7)

mapping_otherstudy_selection_fol___8 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___8.factor = factor(data$otherstudy_selection_fol___8, levels = names(mapping_otherstudy_selection_fol___8), labels = mapping_otherstudy_selection_fol___8)

mapping_otherstudy_selection_fol___9 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___9.factor = factor(data$otherstudy_selection_fol___9, levels = names(mapping_otherstudy_selection_fol___9), labels = mapping_otherstudy_selection_fol___9)

mapping_otherstudy_selection_fol___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$otherstudy_selection_fol___98.factor = factor(data$otherstudy_selection_fol___98, levels = names(mapping_otherstudy_selection_fol___98), labels = mapping_otherstudy_selection_fol___98)

mapping_complete_fol = c(
	"1" = "Yes",
	"0" = "No"
)
data$complete_fol.factor = factor(data$complete_fol, levels = names(mapping_complete_fol), labels = mapping_complete_fol)

mapping_followup_variables_health_seeking_and_vital_status_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$followup_variables_health_seeking_and_vital_status_complete.factor = factor(data$followup_variables_health_seeking_and_vital_status_complete, levels = names(mapping_followup_variables_health_seeking_and_vital_status_complete), labels = mapping_followup_variables_health_seeking_and_vital_status_complete)

mapping_ssas_sample = c(
	"1" = "Yes",
	"0" = "No"
)
data$ssas_sample.factor = factor(data$ssas_sample, levels = names(mapping_ssas_sample), labels = mapping_ssas_sample)

mapping_ssas_sample_collection_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$ssas_sample_collection_complete.factor = factor(data$ssas_sample_collection_complete, levels = names(mapping_ssas_sample_collection_complete), labels = mapping_ssas_sample_collection_complete)

mapping_followtype_pda = c(
	"1" = "Phone",
	"2" = "In-person"
)
data$followtype_pda.factor = factor(data$followtype_pda, levels = names(mapping_followtype_pda), labels = mapping_followtype_pda)

mapping_interviewee_pda = c(
	"1" = "Biological parent",
	"2" = "Grandparent",
	"3" = "Sibling",
	"4" = "Aunt / uncle / cousin",
	"5" = "Stepmother / stepfather",
	"6" = "Care home / orphanage",
	"98" = "Other"
)
data$interviewee_pda.factor = factor(data$interviewee_pda, levels = names(mapping_interviewee_pda), labels = mapping_interviewee_pda)

mapping_intervieweesex_pda = c(
	"1" = "Female",
	"2" = "Male",
	"99" = "N/A (in care)"
)
data$intervieweesex_pda.factor = factor(data$intervieweesex_pda, levels = names(mapping_intervieweesex_pda), labels = mapping_intervieweesex_pda)

mapping_intervieweeage_pda = c(
	"1" = "< 19 years",
	"2" = "19 years to < 51 years",
	"3" = "51 years or older",
	"99" = "N/A (in care)"
)
data$intervieweeage_pda.factor = factor(data$intervieweeage_pda, levels = names(mapping_intervieweeage_pda), labels = mapping_intervieweeage_pda)

mapping_isprimarycaregiver_pda = c(
	"1" = "Yes",
	"0" = "No"
)
data$isprimarycaregiver_pda.factor = factor(data$isprimarycaregiver_pda, levels = names(mapping_isprimarycaregiver_pda), labels = mapping_isprimarycaregiver_pda)

mapping_accident_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Unknown",
	"96" = "Refused to answer"
)
data$accident_pda.factor = factor(data$accident_pda, levels = names(mapping_accident_pda), labels = mapping_accident_pda)

mapping_accidenttype_pda___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___1.factor = factor(data$accidenttype_pda___1, levels = names(mapping_accidenttype_pda___1), labels = mapping_accidenttype_pda___1)

mapping_accidenttype_pda___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___2.factor = factor(data$accidenttype_pda___2, levels = names(mapping_accidenttype_pda___2), labels = mapping_accidenttype_pda___2)

mapping_accidenttype_pda___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___3.factor = factor(data$accidenttype_pda___3, levels = names(mapping_accidenttype_pda___3), labels = mapping_accidenttype_pda___3)

mapping_accidenttype_pda___4 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___4.factor = factor(data$accidenttype_pda___4, levels = names(mapping_accidenttype_pda___4), labels = mapping_accidenttype_pda___4)

mapping_accidenttype_pda___5 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___5.factor = factor(data$accidenttype_pda___5, levels = names(mapping_accidenttype_pda___5), labels = mapping_accidenttype_pda___5)

mapping_accidenttype_pda___6 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___6.factor = factor(data$accidenttype_pda___6, levels = names(mapping_accidenttype_pda___6), labels = mapping_accidenttype_pda___6)

mapping_accidenttype_pda___7 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___7.factor = factor(data$accidenttype_pda___7, levels = names(mapping_accidenttype_pda___7), labels = mapping_accidenttype_pda___7)

mapping_accidenttype_pda___98 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___98.factor = factor(data$accidenttype_pda___98, levels = names(mapping_accidenttype_pda___98), labels = mapping_accidenttype_pda___98)

mapping_accidenttype_pda___97 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___97.factor = factor(data$accidenttype_pda___97, levels = names(mapping_accidenttype_pda___97), labels = mapping_accidenttype_pda___97)

mapping_accidenttype_pda___96 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)
data$accidenttype_pda___96.factor = factor(data$accidenttype_pda___96, levels = names(mapping_accidenttype_pda___96), labels = mapping_accidenttype_pda___96)

mapping_accidentintent_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Unknown",
	"96" = "Refused to answer"
)
data$accidentintent_pda.factor = factor(data$accidentintent_pda, levels = names(mapping_accidentintent_pda), labels = mapping_accidentintent_pda)

mapping_illnessduration_pda = c(
	"1" = "Less than 24 hours",
	"2" = "1 day",
	"3" = "2 days",
	"4" = "3 days",
	"5" = "4 days",
	"6" = "5 days",
	"7" = "6 days",
	"8" = "7 days",
	"9" = "8-14 days",
	"10" = "15-30 days",
	"11" = "More than 30 days",
	"97" = "Dont know",
	"96" = "Refused to answer"
)
data$illnessduration_pda.factor = factor(data$illnessduration_pda, levels = names(mapping_illnessduration_pda), labels = mapping_illnessduration_pda)

mapping_fever_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$fever_pda.factor = factor(data$fever_pda, levels = names(mapping_fever_pda), labels = mapping_fever_pda)

mapping_feverdays_pda = c(
	"1" = "Less than 24 hours",
	"2" = "1 day",
	"3" = "2 days",
	"4" = "3 days",
	"5" = "4 days",
	"6" = "5 days",
	"7" = "6 days",
	"8" = "7 days",
	"9" = "8-14 days",
	"10" = "15-30 days",
	"11" = "More than 30 days",
	"97" = "Dont know"
)
data$feverdays_pda.factor = factor(data$feverdays_pda, levels = names(mapping_feverdays_pda), labels = mapping_feverdays_pda)

mapping_feveruntildeath_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$feveruntildeath_pda.factor = factor(data$feveruntildeath_pda, levels = names(mapping_feveruntildeath_pda), labels = mapping_feveruntildeath_pda)

mapping_feverseverity_pda = c(
	"1" = "Mild < 38C",
	"2" = "Moderate (38-39.5C)",
	"3" = "Severe (>39.5C)",
	"97" = "Dont know"
)
data$feverseverity_pda.factor = factor(data$feverseverity_pda, levels = names(mapping_feverseverity_pda), labels = mapping_feverseverity_pda)

mapping_stools_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$stools_pda.factor = factor(data$stools_pda, levels = names(mapping_stools_pda), labels = mapping_stools_pda)

mapping_stoolsfreq_pda = c(
	"1" = "1 stool",
	"2" = "2 stools",
	"3" = "3 stools",
	"4" = "4 stools",
	"5" = "5 stools",
	"6" = "6 -10 stools",
	"7" = "More than 10 stools",
	"97" = "Dont know"
)
data$stoolsfreq_pda.factor = factor(data$stoolsfreq_pda, levels = names(mapping_stoolsfreq_pda), labels = mapping_stoolsfreq_pda)

mapping_stooluntildeath_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$stooluntildeath_pda.factor = factor(data$stooluntildeath_pda, levels = names(mapping_stooluntildeath_pda), labels = mapping_stooluntildeath_pda)

mapping_cough_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$cough_pda.factor = factor(data$cough_pda, levels = names(mapping_cough_pda), labels = mapping_cough_pda)

mapping_coughdays_pda = c(
	"1" = "Less than 24 hours",
	"2" = "1 day",
	"3" = "2 days",
	"4" = "3 days",
	"5" = "4 days",
	"6" = "5 days",
	"7" = "6 days",
	"8" = "7 days",
	"9" = "8-14 days",
	"10" = "15-30 days",
	"11" = "More than 30 days",
	"97" = "Dont know"
)
data$coughdays_pda.factor = factor(data$coughdays_pda, levels = names(mapping_coughdays_pda), labels = mapping_coughdays_pda)

mapping_coughseverity_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$coughseverity_pda.factor = factor(data$coughseverity_pda, levels = names(mapping_coughseverity_pda), labels = mapping_coughseverity_pda)

mapping_breathdiff_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$breathdiff_pda.factor = factor(data$breathdiff_pda, levels = names(mapping_breathdiff_pda), labels = mapping_breathdiff_pda)

mapping_breathdiffdays_pda = c(
	"1" = "Less than 24 hours",
	"2" = "1 day",
	"3" = "2 days",
	"4" = "3 days",
	"5" = "4 days",
	"6" = "5 days",
	"7" = "6 days",
	"8" = "7 days",
	"9" = "8-14 days",
	"10" = "15-30 days",
	"11" = "More than 30 days",
	"97" = "Dont know"
)
data$breathdiffdays_pda.factor = factor(data$breathdiffdays_pda, levels = names(mapping_breathdiffdays_pda), labels = mapping_breathdiffdays_pda)

mapping_breathfast_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$breathfast_pda.factor = factor(data$breathfast_pda, levels = names(mapping_breathfast_pda), labels = mapping_breathfast_pda)

mapping_breathfastdays_pda = c(
	"1" = "Less than 24 hours",
	"2" = "1 day",
	"3" = "2 days",
	"4" = "3 days",
	"5" = "4 days",
	"6" = "5 days",
	"7" = "6 days",
	"8" = "7 days",
	"9" = "8-14 days",
	"10" = "15-30 days",
	"11" = "More than 30 days",
	"97" = "Dont know"
)
data$breathfastdays_pda.factor = factor(data$breathfastdays_pda, levels = names(mapping_breathfastdays_pda), labels = mapping_breathfastdays_pda)

mapping_indraw_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$indraw_pda.factor = factor(data$indraw_pda, levels = names(mapping_indraw_pda), labels = mapping_indraw_pda)

mapping_grunt_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$grunt_pda.factor = factor(data$grunt_pda, levels = names(mapping_grunt_pda), labels = mapping_grunt_pda)

mapping_convulsion_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$convulsion_pda.factor = factor(data$convulsion_pda, levels = names(mapping_convulsion_pda), labels = mapping_convulsion_pda)

mapping_unconscious_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$unconscious_pda.factor = factor(data$unconscious_pda, levels = names(mapping_unconscious_pda), labels = mapping_unconscious_pda)

mapping_unconshours_pda = c(
	"1" = "Less than 6 hours",
	"2" = "6 to < 24 hours",
	"3" = "24 hours or more",
	"97" = "Dont know"
)
data$unconshours_pda.factor = factor(data$unconshours_pda, levels = names(mapping_unconshours_pda), labels = mapping_unconshours_pda)

mapping_stiffneck_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$stiffneck_pda.factor = factor(data$stiffneck_pda, levels = names(mapping_stiffneck_pda), labels = mapping_stiffneck_pda)

mapping_fontanelle_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$fontanelle_pda.factor = factor(data$fontanelle_pda, levels = names(mapping_fontanelle_pda), labels = mapping_fontanelle_pda)

mapping_skinrash_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$skinrash_pda.factor = factor(data$skinrash_pda, levels = names(mapping_skinrash_pda), labels = mapping_skinrash_pda)

mapping_skinrashdays_pda = c(
	"1" = "Less than 24 hours",
	"2" = "1 day",
	"3" = "2 days",
	"4" = "3 days",
	"5" = "4 days",
	"6" = "5 days",
	"7" = "6 days",
	"8" = "7 days",
	"9" = "8-14 days",
	"10" = "15-30 days",
	"97" = "Dont know"
)
data$skinrashdays_pda.factor = factor(data$skinrashdays_pda, levels = names(mapping_skinrashdays_pda), labels = mapping_skinrashdays_pda)

mapping_skinflake_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$skinflake_pda.factor = factor(data$skinflake_pda, levels = names(mapping_skinflake_pda), labels = mapping_skinflake_pda)

mapping_haircolor_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$haircolor_pda.factor = factor(data$haircolor_pda, levels = names(mapping_haircolor_pda), labels = mapping_haircolor_pda)

mapping_belly_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$belly_pda.factor = factor(data$belly_pda, levels = names(mapping_belly_pda), labels = mapping_belly_pda)

mapping_anemia_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$anemia_pda.factor = factor(data$anemia_pda, levels = names(mapping_anemia_pda), labels = mapping_anemia_pda)

mapping_armpitswell_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$armpitswell_pda.factor = factor(data$armpitswell_pda, levels = names(mapping_armpitswell_pda), labels = mapping_armpitswell_pda)

mapping_bleeding_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$bleeding_pda.factor = factor(data$bleeding_pda, levels = names(mapping_bleeding_pda), labels = mapping_bleeding_pda)

mapping_skinblack_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$skinblack_pda.factor = factor(data$skinblack_pda, levels = names(mapping_skinblack_pda), labels = mapping_skinblack_pda)

mapping_causeknown_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$causeknown_pda.factor = factor(data$causeknown_pda, levels = names(mapping_causeknown_pda), labels = mapping_causeknown_pda)

mapping_certissued_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$certissued_pda.factor = factor(data$certissued_pda, levels = names(mapping_certissued_pda), labels = mapping_certissued_pda)

mapping_certavail_pda = c(
	"1" = "Yes",
	"0" = "No",
	"97" = "Dont know"
)
data$certavail_pda.factor = factor(data$certavail_pda, levels = names(mapping_certavail_pda), labels = mapping_certavail_pda)

mapping_followup_post_discharge_autopsy_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$followup_post_discharge_autopsy_complete.factor = factor(data$followup_post_discharge_autopsy_complete, levels = names(mapping_followup_post_discharge_autopsy_complete), labels = mapping_followup_post_discharge_autopsy_complete)

mapping_recording_data_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)
data$recording_data_complete.factor = factor(data$recording_data_complete, levels = names(mapping_recording_data_complete), labels = mapping_recording_data_complete)

