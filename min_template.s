.data               # start of data section
# put any global or static variables here

.section .rodata    # start of read-only data section
# constants here, such as strings
# modifying these during runtime causes a segmentation fault, so be cautious!


.text               # start of text /code
# everything inside .text is read-only, which includes your code!
.global main        # required, tells gcc where to begin execution

# === functions here ===

main:               # start of main() function
# preamble
pushq %rbp
movq %rsp, %rbp

# === main() code here ===



# clean up and return
movq $0, %rax       # place return value in rax
leave               # undo preamble, clean up the stack
ret                 # return

.section .note.GNU-stack,"",@progbits
# line above sets the stack as non-executable, and removes the compiler warning
# instead of the line above we could also compile with the flag: -z noexecstack
# This creates a new section, with a name the GNU linker recognizes, "" means no section flags, such as: noalloc noexec nowrite
# progbits is program bits, signifying that the section contains actual program data (even if it's an empty section acting as a marker)
