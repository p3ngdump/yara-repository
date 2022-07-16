rule win_cradlecore_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.cradlecore."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cradlecore"
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
        $sequence_0 = { 43 83fb28 72dd 8b4df4 8bc7 5f 5e }
            // n = 7, score = 100
            //   43                   | inc                 ebx
            //   83fb28               | cmp                 ebx, 0x28
            //   72dd                 | jb                  0xffffffdf
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_1 = { 8d4c2428 e8???????? 837c243410 8b442420 89442418 7304 8d442420 }
            // n = 7, score = 100
            //   8d4c2428             | lea                 ecx, [esp + 0x28]
            //   e8????????           |                     
            //   837c243410           | cmp                 dword ptr [esp + 0x34], 0x10
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   7304                 | jae                 6
            //   8d442420             | lea                 eax, [esp + 0x20]

        $sequence_2 = { 3bdf 75c0 5f 8bc6 }
            // n = 4, score = 100
            //   3bdf                 | cmp                 ebx, edi
            //   75c0                 | jne                 0xffffffc2
            //   5f                   | pop                 edi
            //   8bc6                 | mov                 eax, esi

        $sequence_3 = { 8d4dc8 c745c843727970 51 8d45db c745cc7452656c 50 51 }
            // n = 7, score = 100
            //   8d4dc8               | lea                 ecx, [ebp - 0x38]
            //   c745c843727970       | mov                 dword ptr [ebp - 0x38], 0x70797243
            //   51                   | push                ecx
            //   8d45db               | lea                 eax, [ebp - 0x25]
            //   c745cc7452656c       | mov                 dword ptr [ebp - 0x34], 0x6c655274
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_4 = { 8d45c8 53 56 53 683f000f00 53 53 }
            // n = 7, score = 100
            //   8d45c8               | lea                 eax, [ebp - 0x38]
            //   53                   | push                ebx
            //   56                   | push                esi
            //   53                   | push                ebx
            //   683f000f00           | push                0xf003f
            //   53                   | push                ebx
            //   53                   | push                ebx

        $sequence_5 = { 80bc24dc0000002e 750e 8d8c24dc000000 e8???????? eb02 32c0 84c0 }
            // n = 7, score = 100
            //   80bc24dc0000002e     | cmp                 byte ptr [esp + 0xdc], 0x2e
            //   750e                 | jne                 0x10
            //   8d8c24dc000000       | lea                 ecx, [esp + 0xdc]
            //   e8????????           |                     
            //   eb02                 | jmp                 4
            //   32c0                 | xor                 al, al
            //   84c0                 | test                al, al

        $sequence_6 = { e8???????? c745e074c74200 8d45e0 68???????? 50 e9???????? }
            // n = 6, score = 100
            //   e8????????           |                     
            //   c745e074c74200       | mov                 dword ptr [ebp - 0x20], 0x42c774
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   68????????           |                     
            //   50                   | push                eax
            //   e9????????           |                     

        $sequence_7 = { 837f1410 8b9330020000 7204 8b0f eb02 8bcf 83c2fd }
            // n = 7, score = 100
            //   837f1410             | cmp                 dword ptr [edi + 0x14], 0x10
            //   8b9330020000         | mov                 edx, dword ptr [ebx + 0x230]
            //   7204                 | jb                  6
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   eb02                 | jmp                 4
            //   8bcf                 | mov                 ecx, edi
            //   83c2fd               | add                 edx, -3

        $sequence_8 = { 8d8dccfeffff 83bd78feffff00 0f84d9010000 8b8524feffff 83ec0c 8b4004 83a40538fefffffe }
            // n = 7, score = 100
            //   8d8dccfeffff         | lea                 ecx, [ebp - 0x134]
            //   83bd78feffff00       | cmp                 dword ptr [ebp - 0x188], 0
            //   0f84d9010000         | je                  0x1df
            //   8b8524feffff         | mov                 eax, dword ptr [ebp - 0x1dc]
            //   83ec0c               | sub                 esp, 0xc
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   83a40538fefffffe     | and                 dword ptr [ebp + eax - 0x1c8], 0xfffffffe

        $sequence_9 = { e8???????? 837c243410 8b5c2420 7206 895c2418 eb08 8d442420 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   837c243410           | cmp                 dword ptr [esp + 0x34], 0x10
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   7206                 | jb                  8
            //   895c2418             | mov                 dword ptr [esp + 0x18], ebx
            //   eb08                 | jmp                 0xa
            //   8d442420             | lea                 eax, [esp + 0x20]

    condition:
        7 of them and filesize < 450560
}