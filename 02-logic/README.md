# Lab 2: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAMEE

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

   ![K-maps](BvetsiA.jpg)!

   

   Less than:

   ![K-maps](images/kmap_empty.png)![BmensiA](https://user-images.githubusercontent.com/124770381/220407028-dee153e0-e4dc-457c-b22d-487a54132c4f.jpg)


2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](images/comparator_min.png)![POSSOP](https://user-images.githubusercontent.com/124770381/220409594-da210a01-c28e-4143-88ea-960242016f7f.jpg)


### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx52**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";

-- First test case ...
        s_b <= "0101"; s_a <= "0010"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination 0101, 0010 FAILED" severity error;
        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait; -- Data generation process is suspended forever
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

   https://www.edaplayground.com/x/JRkP
