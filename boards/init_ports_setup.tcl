
### ADC

create_bd_port -dir I -from 13 -to 0 adc_dat_a_i
create_bd_port -dir I -from 13 -to 0 adc_dat_b_i

create_bd_port -dir I adc_clk_p_i
create_bd_port -dir I adc_clk_n_i

create_bd_port -dir O adc_clk_p_o
create_bd_port -dir O adc_clk_n_o

create_bd_port -dir O adc_enc_p_o
create_bd_port -dir O adc_enc_n_o

create_bd_port -dir O adc_cdcs_o

### DAC

create_bd_port -dir O -from 13 -to 0 dac_dat_o

create_bd_port -dir O dac_clk_o
create_bd_port -dir O dac_rst_o
create_bd_port -dir O dac_sel_o
create_bd_port -dir O dac_wrt_o

### PWM

create_bd_port -dir O -from 3 -to 0 dac_pwm_o

### XADC

create_bd_port -dir I -from 4 -to 0 vinp_i
create_bd_port -dir I -from 4 -to 0 vinn_i

### Expansion connector

create_bd_port -dir IO -from 7 -to 0 exp_p_io
create_bd_port -dir IO -from 7 -to 0 exp_n_io

### SATA connector

create_bd_port -dir O -from 1 -to 0 daisy_p_o
create_bd_port -dir O -from 1 -to 0 daisy_n_o

create_bd_port -dir I -from 1 -to 0 daisy_p_i
create_bd_port -dir I -from 1 -to 0 daisy_n_i

### LED

create_bd_port -dir O -from 7 -to 0 led_o
