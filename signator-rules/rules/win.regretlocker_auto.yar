rule win_regretlocker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.regretlocker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.regretlocker"
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
        $sequence_0 = { ff15???????? 85c0 7523 56 8b7508 8bce }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7523                 | jne                 0x25
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8bce                 | mov                 ecx, esi

        $sequence_1 = { 8bcf 50 e8???????? 84c0 7416 57 }
            // n = 6, score = 100
            //   8bcf                 | mov                 ecx, edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7416                 | je                  0x18
            //   57                   | push                edi

        $sequence_2 = { 50 ff7508 e8???????? 33f6 8d4dcc 837de010 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   33f6                 | xor                 esi, esi
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]
            //   837de010             | cmp                 dword ptr [ebp - 0x20], 0x10

        $sequence_3 = { 8d45f0 50 e8???????? 8b45f0 59 b980969800 f7e9 }
            // n = 7, score = 100
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   59                   | pop                 ecx
            //   b980969800           | mov                 ecx, 0x989680
            //   f7e9                 | imul                ecx

        $sequence_4 = { 8bf1 8b4e04 394e08 7415 8b4508 }
            // n = 5, score = 100
            //   8bf1                 | mov                 esi, ecx
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   394e08               | cmp                 dword ptr [esi + 8], ecx
            //   7415                 | je                  0x17
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_5 = { 83ec28 53 8bd9 56 8b431c 8b08 85c9 }
            // n = 7, score = 100
            //   83ec28               | sub                 esp, 0x28
            //   53                   | push                ebx
            //   8bd9                 | mov                 ebx, ecx
            //   56                   | push                esi
            //   8b431c               | mov                 eax, dword ptr [ebx + 0x1c]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   85c9                 | test                ecx, ecx

        $sequence_6 = { 898d24ffffff 898d28ffffff 8d8d14ffffff 50 e8???????? 8d85fcfeffff c645fc0c }
            // n = 7, score = 100
            //   898d24ffffff         | mov                 dword ptr [ebp - 0xdc], ecx
            //   898d28ffffff         | mov                 dword ptr [ebp - 0xd8], ecx
            //   8d8d14ffffff         | lea                 ecx, [ebp - 0xec]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   c645fc0c             | mov                 byte ptr [ebp - 4], 0xc

        $sequence_7 = { c645fc0f 8bcc 6a23 895910 c741140f000000 68???????? }
            // n = 6, score = 100
            //   c645fc0f             | mov                 byte ptr [ebp - 4], 0xf
            //   8bcc                 | mov                 ecx, esp
            //   6a23                 | push                0x23
            //   895910               | mov                 dword ptr [ecx + 0x10], ebx
            //   c741140f000000       | mov                 dword ptr [ecx + 0x14], 0xf
            //   68????????           |                     

        $sequence_8 = { 8b01 ff6018 b8???????? e8???????? 81ec74010000 53 56 }
            // n = 7, score = 100
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   ff6018               | jmp                 dword ptr [eax + 0x18]
            //   b8????????           |                     
            //   e8????????           |                     
            //   81ec74010000         | sub                 esp, 0x174
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_9 = { 6a04 8d450c 50 e8???????? 8bf0 e8???????? 85f6 }
            // n = 7, score = 100
            //   6a04                 | push                4
            //   8d450c               | lea                 eax, [ebp + 0xc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   85f6                 | test                esi, esi

    condition:
        7 of them and filesize < 1021952
}