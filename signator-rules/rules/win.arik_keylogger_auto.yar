rule win_arik_keylogger_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.arik_keylogger."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.arik_keylogger"
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
        $sequence_0 = { e8???????? 6689c6 eb0b 8d430c e8???????? 6689c6 6685f6 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6689c6               | mov                 si, ax
            //   eb0b                 | jmp                 0xd
            //   8d430c               | lea                 eax, [ebx + 0xc]
            //   e8????????           |                     
            //   6689c6               | mov                 si, ax
            //   6685f6               | test                si, si

        $sequence_1 = { e8???????? 8b45fc 8b40f8 8b404c 8945d0 8b45f0 48 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b40f8               | mov                 eax, dword ptr [eax - 8]
            //   8b404c               | mov                 eax, dword ptr [eax + 0x4c]
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   48                   | dec                 eax

        $sequence_2 = { e9???????? 8b45cc 83f806 7408 8b45cc 83f802 7522 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b45cc               | mov                 eax, dword ptr [ebp - 0x34]
            //   83f806               | cmp                 eax, 6
            //   7408                 | je                  0xa
            //   8b45cc               | mov                 eax, dword ptr [ebp - 0x34]
            //   83f802               | cmp                 eax, 2
            //   7522                 | jne                 0x24

        $sequence_3 = { e8???????? 58 85c0 7414 e8???????? e8???????? eb08 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   58                   | pop                 eax
            //   85c0                 | test                eax, eax
            //   7414                 | je                  0x16
            //   e8????????           |                     
            //   e8????????           |                     
            //   eb08                 | jmp                 0xa

        $sequence_4 = { e8???????? 50 85c0 7546 8d4dcc 8d55b4 b801000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   85c0                 | test                eax, eax
            //   7546                 | jne                 0x48
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]
            //   8d55b4               | lea                 edx, [ebp - 0x4c]
            //   b801000000           | mov                 eax, 1

        $sequence_5 = { 8d4598 e8???????? c7459800000000 8d45f8 e8???????? c745f800000000 58 }
            // n = 7, score = 100
            //   8d4598               | lea                 eax, [ebp - 0x68]
            //   e8????????           |                     
            //   c7459800000000       | mov                 dword ptr [ebp - 0x68], 0
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   e8????????           |                     
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   58                   | pop                 eax

        $sequence_6 = { e8???????? 50 85c0 0f8552020000 ba???????? b800000000 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   85c0                 | test                eax, eax
            //   0f8552020000         | jne                 0x258
            //   ba????????           |                     
            //   b800000000           | mov                 eax, 0
            //   e8????????           |                     

        $sequence_7 = { eb17 c745f401000000 eb0e 8b55fc 8b45f8 e8???????? 8945f4 }
            // n = 7, score = 100
            //   eb17                 | jmp                 0x19
            //   c745f401000000       | mov                 dword ptr [ebp - 0xc], 1
            //   eb0e                 | jmp                 0x10
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   e8????????           |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_8 = { f3a5 66a5 8b45d4 8a5001 81e280000000 83ca04 89d0 }
            // n = 7, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   8a5001               | mov                 dl, byte ptr [eax + 1]
            //   81e280000000         | and                 edx, 0x80
            //   83ca04               | or                  edx, 4
            //   89d0                 | mov                 eax, edx

        $sequence_9 = { ff9178040000 89c6 8b16 ff9260040000 84c0 7503 ff4df4 }
            // n = 7, score = 100
            //   ff9178040000         | call                dword ptr [ecx + 0x478]
            //   89c6                 | mov                 esi, eax
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   ff9260040000         | call                dword ptr [edx + 0x460]
            //   84c0                 | test                al, al
            //   7503                 | jne                 5
            //   ff4df4               | dec                 dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 4947968
}