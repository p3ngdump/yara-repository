rule win_tinymet_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.tinymet."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tinymet"
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
        $sequence_0 = { ff15???????? 50 e8???????? 59 8d45f0 6a04 50 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   6a04                 | push                4
            //   50                   | push                eax

        $sequence_1 = { 7509 a1???????? 8b30 eb03 83c602 6a2e 56 }
            // n = 7, score = 100
            //   7509                 | jne                 0xb
            //   a1????????           |                     
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   eb03                 | jmp                 5
            //   83c602               | add                 esi, 2
            //   6a2e                 | push                0x2e
            //   56                   | push                esi

        $sequence_2 = { 85ff 0f84c0000000 53 53 6a03 53 53 }
            // n = 7, score = 100
            //   85ff                 | test                edi, edi
            //   0f84c0000000         | je                  0xc6
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   6a03                 | push                3
            //   53                   | push                ebx
            //   53                   | push                ebx

        $sequence_3 = { 8bf8 83c410 85ff 7447 33c0 }
            // n = 5, score = 100
            //   8bf8                 | mov                 edi, eax
            //   83c410               | add                 esp, 0x10
            //   85ff                 | test                edi, edi
            //   7447                 | je                  0x49
            //   33c0                 | xor                 eax, eax

        $sequence_4 = { e8???????? 83c40c a3???????? eb17 837dfc01 0f8594000000 ff30 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   a3????????           |                     
            //   eb17                 | jmp                 0x19
            //   837dfc01             | cmp                 dword ptr [ebp - 4], 1
            //   0f8594000000         | jne                 0x9a
            //   ff30                 | push                dword ptr [eax]

        $sequence_5 = { 0fbe043e 03d8 46 57 e8???????? 59 3bf0 }
            // n = 7, score = 100
            //   0fbe043e             | movsx               eax, byte ptr [esi + edi]
            //   03d8                 | add                 ebx, eax
            //   46                   | inc                 esi
            //   57                   | push                edi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   3bf0                 | cmp                 esi, eax

        $sequence_6 = { 53 8b1d???????? 6a04 68???????? 56 8975fc ffd3 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   6a04                 | push                4
            //   68????????           |                     
            //   56                   | push                esi
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   ffd3                 | call                ebx

        $sequence_7 = { 5d c3 55 8bec 81eca4010000 8d855cfeffff 53 }
            // n = 7, score = 100
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81eca4010000         | sub                 esp, 0x1a4
            //   8d855cfeffff         | lea                 eax, [ebp - 0x1a4]
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 57344
}