rule win_liteduke_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.liteduke."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.liteduke"
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
        $sequence_0 = { 8d925cf5ffff c70200000000 8b45d0 8b5df4 2b5834 8bb0a0000000 09f6 }
            // n = 7, score = 200
            //   8d925cf5ffff         | lea                 edx, [edx - 0xaa4]
            //   c70200000000         | mov                 dword ptr [edx], 0
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   8b5df4               | mov                 ebx, dword ptr [ebp - 0xc]
            //   2b5834               | sub                 ebx, dword ptr [eax + 0x34]
            //   8bb0a0000000         | mov                 esi, dword ptr [eax + 0xa0]
            //   09f6                 | or                  esi, esi

        $sequence_1 = { ff15???????? ff75fc ff15???????? 6a00 ff15???????? 5b 5e }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi

        $sequence_2 = { ff7508 ff15???????? 83c414 ff7510 6a01 ff75fc ff15???????? }
            // n = 7, score = 200
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   6a01                 | push                1
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     

        $sequence_3 = { aa 5f 5e c9 c21000 55 89e5 }
            // n = 7, score = 200
            //   aa                   | stosb               byte ptr es:[edi], al
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c21000               | ret                 0x10
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp

        $sequence_4 = { ff35???????? 50 ff15???????? 83c40c 50 6800800000 6a00 }
            // n = 7, score = 200
            //   ff35????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   50                   | push                eax
            //   6800800000           | push                0x8000
            //   6a00                 | push                0

        $sequence_5 = { ff35???????? e8???????? ff35???????? ff15???????? c705????????00000000 6a04 }
            // n = 6, score = 200
            //   ff35????????         |                     
            //   e8????????           |                     
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   c705????????00000000     |     
            //   6a04                 | push                4

        $sequence_6 = { 5f 696e7465727661 6c 2c20 7365 7276 65725f }
            // n = 7, score = 200
            //   5f                   | pop                 edi
            //   696e7465727661       | imul                ebp, dword ptr [esi + 0x74], 0x61767265
            //   6c                   | insb                byte ptr es:[edi], dx
            //   2c20                 | sub                 al, 0x20
            //   7365                 | jae                 0x67
            //   7276                 | jb                  0x78
            //   65725f               | jb                  0x62

        $sequence_7 = { c10810 83c004 c10818 89ec }
            // n = 4, score = 200
            //   c10810               | ror                 dword ptr [eax], 0x10
            //   83c004               | add                 eax, 4
            //   c10818               | ror                 dword ptr [eax], 0x18
            //   89ec                 | mov                 esp, ebp

        $sequence_8 = { ff7508 e8???????? 6a00 6a00 ff7508 e8???????? }
            // n = 6, score = 200
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_9 = { 6a00 ff7508 e8???????? 83c408 c745f804000000 8b4508 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   c745f804000000       | mov                 dword ptr [ebp - 8], 4
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 1171456
}