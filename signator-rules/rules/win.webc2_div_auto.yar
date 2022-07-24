rule win_webc2_div_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.webc2_div."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_div"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 59 33c0 eb1f ffd6 ff75fc }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax
            //   eb1f                 | jmp                 0x21
            //   ffd6                 | call                esi
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_1 = { 8d8c2420020000 51 ffd3 8bf8 83c408 }
            // n = 5, score = 100
            //   8d8c2420020000       | lea                 ecx, [esp + 0x220]
            //   51                   | push                ecx
            //   ffd3                 | call                ebx
            //   8bf8                 | mov                 edi, eax
            //   83c408               | add                 esp, 8

        $sequence_2 = { 50 ff15???????? 69c0005c2605 59 eb11 8d4505 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   69c0005c2605         | imul                eax, eax, 0x5265c00
            //   59                   | pop                 ecx
            //   eb11                 | jmp                 0x13
            //   8d4505               | lea                 eax, [ebp + 5]

        $sequence_3 = { 80c214 88540410 eb0e 83f829 7e09 }
            // n = 5, score = 100
            //   80c214               | add                 dl, 0x14
            //   88540410             | mov                 byte ptr [esp + eax + 0x10], dl
            //   eb0e                 | jmp                 0x10
            //   83f829               | cmp                 eax, 0x29
            //   7e09                 | jle                 0xb

        $sequence_4 = { f3ab 8bca 53 ff7508 83e103 f3aa }
            // n = 6, score = 100
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8bca                 | mov                 ecx, edx
            //   53                   | push                ebx
            //   ff7508               | push                dword ptr [ebp + 8]
            //   83e103               | and                 ecx, 3
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_5 = { 3bc8 0f8c2effffff 56 e8???????? }
            // n = 4, score = 100
            //   3bc8                 | cmp                 ecx, eax
            //   0f8c2effffff         | jl                  0xffffff34
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_6 = { 7573 80780661 756d 80780766 7567 80780865 7561 }
            // n = 7, score = 100
            //   7573                 | jne                 0x75
            //   80780661             | cmp                 byte ptr [eax + 6], 0x61
            //   756d                 | jne                 0x6f
            //   80780766             | cmp                 byte ptr [eax + 7], 0x66
            //   7567                 | jne                 0x69
            //   80780865             | cmp                 byte ptr [eax + 8], 0x65
            //   7561                 | jne                 0x63

        $sequence_7 = { 68005c2605 e9???????? a1???????? 83e800 0f84c2000000 }
            // n = 5, score = 100
            //   68005c2605           | push                0x5265c00
            //   e9????????           |                     
            //   a1????????           |                     
            //   83e800               | sub                 eax, 0
            //   0f84c2000000         | je                  0xc8

        $sequence_8 = { 83f826 7f0b 8ad0 80c214 88540410 eb0e 83f829 }
            // n = 7, score = 100
            //   83f826               | cmp                 eax, 0x26
            //   7f0b                 | jg                  0xd
            //   8ad0                 | mov                 dl, al
            //   80c214               | add                 dl, 0x14
            //   88540410             | mov                 byte ptr [esp + eax + 0x10], dl
            //   eb0e                 | jmp                 0x10
            //   83f829               | cmp                 eax, 0x29

        $sequence_9 = { eb14 817c2410808d5b00 771a 8b442414 0540f087fc 50 }
            // n = 6, score = 100
            //   eb14                 | jmp                 0x16
            //   817c2410808d5b00     | cmp                 dword ptr [esp + 0x10], 0x5b8d80
            //   771a                 | ja                  0x1c
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   0540f087fc           | add                 eax, 0xfc87f040
            //   50                   | push                eax

    condition:
        7 of them and filesize < 32768
}